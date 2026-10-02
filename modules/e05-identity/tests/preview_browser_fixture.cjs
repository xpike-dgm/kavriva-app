'use strict';
// Synthetic loopback fixture only: no product renderer, actual account or source.
// Existing Playwright/browser paths are explicit inputs; no install or download.
const assert = require('node:assert/strict');
const http = require('node:http');
const path = require('node:path');
const { execFileSync } = require('node:child_process');

async function listen(host, handler) {
  const server = http.createServer(handler);
  await new Promise((resolve, reject) => {
    server.once('error', reject);
    server.listen(0, host, resolve);
  });
  return server;
}

function close(server) {
  return new Promise((resolve, reject) => {
    if (!server) return resolve();
    server.closeAllConnections();
    server.close(error => error ? reject(error) : resolve());
  });
}

function escapeText(text) {
  return text.replaceAll('&', '&amp;').replaceAll('<', '&lt;').replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;').replaceAll("'", '&#39;');
}

async function main() {
  const [playwrightPath, browserPath, pythonPath] = process.argv.slice(2);
  if (!playwrightPath || !browserPath || !pythonPath || process.argv.length !== 5)
    throw new Error('EXPLICIT_EXISTING_RUNTIME_PATHS_REQUIRED');
  const { chromium } = require(playwrightPath);
  const policy = JSON.parse(execFileSync(pythonPath,
    [path.join(__dirname, 'test_preview_isolation.py'), '--browser-fixture-policy'],
    { encoding: 'utf8', windowsHide: true }));
  let operations, preview, browser;
  const delivered = [], prohibited = [], operationsCookies = [];
  const hostile = '<script>window.fixtureExecuted=true;fetch("/blocked")</script>' +
    '<img src="/blocked"><iframe src="/blocked"></iframe>' +
    '<form action="/blocked"><button>submit</button></form>' +
    '<a target="_top" href="/blocked">navigate</a>';
  try {
    operations = await listen('127.0.0.1', (req, res) => {
      if (req.url !== '/') { prohibited.push('operations:' + req.url); res.writeHead(403); res.end(); return; }
      operationsCookies.push(req.headers.cookie);
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' });
      res.end('<!doctype html><title>Operations fixture</title>' +
        '<iframe title="Untrusted fixture" sandbox referrerpolicy="no-referrer" ' +
        'src="' + previewUrl + '/probe"></iframe>');
    });
    const operationsUrl = 'http://127.0.0.1:' + operations.address().port;
    preview = await listen('127.0.0.2', (req, res) => {
      if (!['/probe', '/passive'].includes(req.url)) {
        prohibited.push('preview:' + req.url); res.writeHead(403); res.end(); return;
      }
      delivered.push({ path: req.url, cookie: req.headers.cookie, authorization: req.headers.authorization,
                       referrer: req.headers.referer });
      // Loopback HTTP is test-only. Only ancestor origin changes from policy's
      // HTTPS production requirement; all no-script/resource/sandbox rules stay.
      const headers = { ...policy, 'Content-Security-Policy':
        policy['Content-Security-Policy'].replace('https://operations.example', operationsUrl) };
      res.writeHead(200, headers);
      res.end('<!doctype html><title>Untrusted preview fixture</title>' +
        (req.url === '/probe' ? hostile : '<pre>' + escapeText(hostile) + '</pre>'));
    });
    const previewUrl = 'http://127.0.0.2:' + preview.address().port;
    browser = await chromium.launch({ executablePath: browserPath, headless: true,
                                      chromiumSandbox: true });
    const context = await browser.newContext({ bypassCSP: false, acceptDownloads: false,
                                               serviceWorkers: 'block' });
    // Synthetic host-only marker, not a user credential. No default profile.
    await context.addCookies([{ name: 'fixture_app_cookie', value: 'synthetic-only',
                               url: operationsUrl, httpOnly: true, sameSite: 'Lax' }]);
    // Contain fixture requests to the two ephemeral servers. These routes are a
    // test harness fence, NOT evidence of production/browser network containment.
    let attemptedOtherNetwork = 0;
    await context.route('**/*', route => {
      const origin = new URL(route.request().url()).origin;
      if (![operationsUrl, previewUrl].includes(origin)) {
        attemptedOtherNetwork++; return route.abort();
      }
      return route.continue();
    });
    const page = await context.newPage();
    let dialogs = 0, downloads = 0, popups = 0;
    page.on('dialog', dialog => { dialogs++; dialog.dismiss(); });
    page.on('download', download => { downloads++; download.cancel(); });
    page.on('popup', popup => { popups++; popup.close(); });
    await page.goto(operationsUrl, { waitUntil: 'load' });
    const frame = page.frames().find(f => f.url() === previewUrl + '/probe');
    assert.ok(frame, 'PROBE_FRAME_MISSING');
    assert.equal(await frame.evaluate(() => window.fixtureExecuted === true), false);
    assert.equal(await page.evaluate(() => document.querySelector('iframe').contentDocument), null);
    assert.equal(await frame.evaluate(() => {
      try { return document.cookie; } catch (error) { return error.name; }
    }), 'SecurityError');
    await frame.locator('button').click();
    await frame.locator('a').click();
    assert.equal(page.url(), operationsUrl + '/');
    assert.equal(frame.url(), previewUrl + '/probe');
    await frame.goto(previewUrl + '/passive', { waitUntil: 'load' });
    assert.equal(await frame.locator('pre').textContent(), hostile);
    assert.equal(await frame.locator('script,img,iframe,form,a').count(), 0);
    const direct = await context.newPage();
    await direct.goto(previewUrl + '/probe', { waitUntil: 'load' });
    assert.equal(await direct.evaluate(() => window.fixtureExecuted === true), false);
    assert.equal(await direct.evaluate(() => {
      try { return document.cookie; } catch (error) { return error.name; }
    }), 'SecurityError');
    assert.ok(delivered.length >= 3);
    assert.ok(operationsCookies.some(value => value && value.includes('fixture_app_cookie=synthetic-only')),
              'POSITIVE_OPERATIONS_COOKIE_WITNESS_MISSING');
    for (const item of delivered) {
      assert.equal(item.cookie, undefined);
      assert.equal(item.authorization, undefined);
      assert.equal(item.referrer, undefined);
    }
    assert.deepEqual(prohibited, []);
    assert.equal(attemptedOtherNetwork, 0);
    assert.equal(dialogs + downloads + popups, 0);
    console.log(JSON.stringify({ result: 'PASS', browser: browser.version(),
      deliveredPreviewRequests: delivered.length, syntheticCookieAbsent: true,
      scriptResourceFormTopNavigationBlocked: true, opaqueCookieAccess: true,
      directEntrySandbox: true, escapedPassiveText: true,
      limitation: 'Local HTTP synthetic browser fixture only; no product/HTTPS/mobile or native-print containment proof' }));
    await context.close();
  } finally {
    if (browser) await browser.close();
    await Promise.all([close(operations), close(preview)]);
  }
}

main().catch(() => { console.error('BROWSER_FIXTURE_FAILED'); process.exitCode = 1; });
