import { chromium } from 'playwright';
import AxeBuilder from '@axe-core/playwright';
import assert from 'node:assert/strict';
import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { createHash } from 'node:crypto';
import { staticServer } from './server.mjs';

const root = fileURLToPath(new URL('../', import.meta.url));
const out = resolve(process.env.E2_SHELL_EVIDENCE_DIR || root + '/artifacts/browser');
await mkdir(out, { recursive: true });
const result = { scope: 'Closed product-shell candidate; no operational identity/data binding', cases: [], images: [], uiRequests: [], errors: [], csp: [] };
let failures = 0;
const server = await staticServer();
const browser = await chromium.launch({ headless: true });
let zoomContext;
async function capture(page, label, cdp) {
  const path = resolve(out, label + '.png');
  let bytes;
  if (cdp) {
    const shot = await cdp.send('Page.captureScreenshot', { format: 'png', fromSurface: true, captureBeyondViewport: false });
    bytes = Buffer.from(shot.data, 'base64'); await writeFile(path, bytes);
  } else {
    await page.screenshot({ path, fullPage: true }); bytes = await readFile(path);
  }
  result.images.push({ label, path, bytes: bytes.length, sha256: createHash('sha256').update(bytes).digest('hex'), width: bytes.readUInt32BE(16), height: bytes.readUInt32BE(20) });
}
async function test(label, action) {
  try { await action(); result.cases.push({ label, result: 'PASS' }); }
  catch (error) { failures++; result.cases.push({ label, result: 'FAIL', error: error.message }); }
}
async function layout(page) {
  assert.ok(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth));
  const panels = await page.locator('.workspace-panel').evaluateAll(es => es.map(e => {
    const b = e.getBoundingClientRect(); return { left: b.left, top: b.top, right: b.right, bottom: b.bottom };
  }));
  assert.equal(panels.length, 3);
  for (let i = 0; i < panels.length; i++) for (let j = i + 1; j < panels.length; j++) {
    const a = panels[i], b = panels[j];
    assert.ok(a.right <= b.left || b.right <= a.left || a.bottom <= b.top || b.bottom <= a.top);
  }
}
try {
  result.browser = browser.version();
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 }, locale: 'tr-TR' });
  const page = await context.newPage();
  page.on('pageerror', e => result.errors.push(e.message));
  page.on('request', req => result.uiRequests.push({ method: req.method(), url: req.url() }));
  page.on('console', msg => { if (msg.type() === 'error' && /Content Security Policy|violates.*directive|Refused/.test(msg.text())) result.csp.push(msg.text()); });
  await page.goto(server.origin); await page.getByRole('heading', { name: 'Yönetim çalışma alanı', exact: true }).waitFor();
  await test('baseline-three-panels-no-overlap-and-axe', async () => {
    await layout(page);
    const axe = await new AxeBuilder({ page }).withTags(['wcag2a', 'wcag2aa', 'wcag21a', 'wcag21aa']).analyze();
    result.axe = axe.violations; assert.equal(axe.violations.length, 0, JSON.stringify(axe.violations));
    await capture(page, 'baseline');
  });
  await test('keyboard-skip-and-local-navigation', async () => {
    await page.keyboard.press('Tab'); assert.equal(await page.locator(':focus').innerText(), 'İçeriğe geç');
    await page.keyboard.press('Enter'); assert.equal(await page.locator(':focus').getAttribute('id'), 'workspace');
    for (const [label, id] of [['Çalışma listesi', 'work-list'], ['Kayıt bağlamı', 'record-context'], ['İşlem durumu', 'activity'], ['Destek', 'help']]) {
      const link = page.getByRole('navigation').getByRole('link', { name: label, exact: true });
      await link.focus(); assert.notEqual(await link.evaluate(e => getComputedStyle(e).outlineStyle), 'none');
      await page.keyboard.press('Enter'); assert.equal(await page.locator(':focus').getAttribute('id'), id);
    }
  });
  await test('unverified-connection-is-not-empty-or-success', async () => {
    await page.getByText('Bu ekran kayıt sistemine bağlı değil. Özel kayıtlar ve işlemler kapalıdır.', { exact: true }).waitFor();
    assert.equal(await page.locator('button, form, input, textarea, tbody tr').count(), 0);
    assert.match(await page.locator('#work-list').innerText(), /boş veya işlerin tamamlanmış olduğu anlamına gelmez/);
    assert.equal((await context.cookies()).length, 0);
  });
  await test('query-and-browser-role-do-not-activate-access', async () => {
    await context.addInitScript(() => {
      localStorage.setItem('role', 'admin'); localStorage.setItem('ALLOW', 'true');
      localStorage.setItem('actor', 'forged-operator');
    });
    await page.goto(server.origin + '/?role=admin&ALLOW=true&record=OBJ-0001');
    await page.getByRole('heading', { name: 'Yönetim çalışma alanı', exact: true }).waitFor();
    assert.equal(await page.locator('button, form, input, textarea, tbody tr').count(), 0);
    const body = await page.locator('body').innerText();
    assert.ok(!body.includes('forged-operator') && !body.includes('OBJ-0001'));
    assert.match(await page.getByRole('status').innerText(), /erişim doğrulanmadı/);
  });
  await test('static-test-host-has-no-login-data-or-write-route', async () => {
    for (const path of ['/api/workspace', '/api/login', '/api/commands']) {
      const response = await context.request.post(server.origin + path, { data: { role: 'admin' } });
      assert.equal(response.status(), 404); assert.equal(response.headers()['set-cookie'], undefined);
    }
  });
  await test('no-JavaScript-has-explicit-closed-explanation', async () => {
    const nojs = await browser.newContext({ javaScriptEnabled: false });
    try {
      const plain = await nojs.newPage(); await plain.goto(server.origin);
      assert.match(await plain.locator('noscript').innerText(), /JavaScript olmadan açılamaz/);
      assert.equal(await plain.locator('button, form, input, textarea').count(), 0);
      await capture(plain, 'no-javascript');
    } finally { await nojs.close(); }
  });
  await test('product-UI-makes-no-data-or-effect-request', async () => {
    assert.ok(result.uiRequests.every(r => r.method === 'GET' && !new URL(r.url).pathname.startsWith('/api/')));
    assert.equal(result.errors.length, 0); assert.equal(result.csp.length, 0);
  });
  await context.close();
  await test('actual-200-percent-zoom-layout-keyboard-and-native-frames', async () => {
    const extension = resolve(root, 'tests/zoom-extension');
    zoomContext = await chromium.launchPersistentContext('', {
      channel: 'chromium', headless: true, viewport: { width: 1440, height: 900 },
      args: ['--disable-extensions-except=' + extension, '--load-extension=' + extension],
    });
    zoomContext.setDefaultTimeout(10000);
    const worker = zoomContext.serviceWorkers()[0] || await zoomContext.waitForEvent('serviceworker', { timeout: 15000 });
    const zoomPage = await zoomContext.newPage(); await zoomPage.goto(server.origin);
    await zoomPage.getByRole('heading', { name: 'Yönetim çalışma alanı', exact: true }).waitFor();
    const before = await zoomPage.evaluate(() => ({ width: innerWidth, cssZoom: getComputedStyle(document.documentElement).zoom }));
    const zoom = await worker.evaluate(async origin => {
      const tab = (await chrome.tabs.query({})).find(t => t.url?.startsWith(origin + '/'));
      if (!tab?.id) throw Error('Only scoped static test tab may be zoomed');
      await chrome.tabs.setZoom(tab.id, 2); return chrome.tabs.getZoom(tab.id);
    }, server.origin);
    assert.equal(zoom, 2); await zoomPage.waitForFunction(() => innerWidth === 720);
    assert.equal(await zoomPage.evaluate(() => getComputedStyle(document.documentElement).zoom), before.cssZoom);
    await layout(zoomPage);
    result.actualZoom = { before, width: await zoomPage.evaluate(() => innerWidth), reportedZoom: zoom, cssZoomChanged: false };
    const cdp = await zoomContext.newCDPSession(zoomPage); let reachedBottom = false;
    for (let frame = 0; frame < 20; frame++) {
      await zoomPage.waitForTimeout(100);
      const pos = await zoomPage.evaluate(() => ({ y: scrollY, max: document.documentElement.scrollHeight - innerHeight, step: Math.floor(innerHeight * .8) }));
      await capture(zoomPage, 'actual-zoom-200-' + String(frame).padStart(2, '0'), cdp);
      const last = result.images.at(-1); assert.equal(last.width, 1440); assert.equal(last.height, 900);
      last.scrollY = pos.y; last.scrollMax = pos.max;
      if (pos.y >= pos.max - 1) { reachedBottom = true; break; }
      await zoomPage.evaluate(step => scrollBy(0, step), pos.step);
    }
    assert.ok(reachedBottom, 'Natural viewport sequence must reach actual bottom');
    await zoomPage.keyboard.press('Tab'); assert.equal(await zoomPage.locator(':focus').innerText(), 'İçeriğe geç');
    await zoomPage.keyboard.press('Enter'); assert.equal(await zoomPage.locator(':focus').getAttribute('id'), 'workspace');
    await zoomPage.getByRole('navigation').getByRole('link', { name: 'Destek', exact: true }).focus();
    await zoomPage.keyboard.press('Enter'); assert.equal(await zoomPage.locator(':focus').getAttribute('id'), 'help');
  });
} catch (error) { failures++; result.fatal = error.stack || error.message; }
finally {
  if (zoomContext) await zoomContext.close(); await browser.close(); await server.close();
  result.result = failures ? 'FAIL' : 'PASS';
  await writeFile(resolve(out, 'results.json'), JSON.stringify(result, null, 2));
  console.log(JSON.stringify({ result: result.result, cases: result.cases, images: result.images.length }));
}
process.exitCode = failures ? 1 : 0;
