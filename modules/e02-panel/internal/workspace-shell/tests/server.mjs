// Test-only static server: no account, cookie, data API or authorization fixture.
import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { resolve, sep, extname } from 'node:path';
import { fileURLToPath } from 'node:url';
const here = fileURLToPath(new URL('../', import.meta.url));
export async function staticServer() {
  const root = resolve(here, 'dist');
  const requests = [];
  const server = createServer(async (req, res) => {
    requests.push({ method: req.method, path: req.url });
    res.setHeader('Cache-Control', 'private, no-store');
    res.setHeader('Content-Security-Policy', "default-src 'none'; script-src 'self'; style-src 'self'; connect-src 'none'; base-uri 'none'; frame-ancestors 'none'; form-action 'none'; object-src 'none'");
    res.setHeader('X-Content-Type-Options', 'nosniff');
    const reject = () => { res.writeHead(404); res.end('Not found'); };
    if (req.method !== 'GET' || /%|\.\.|\/\//.test(req.url)) return reject();
    const pathname = new URL(req.url, 'http://127.0.0.1').pathname;
    if (pathname !== '/' && !pathname.startsWith('/assets/')) return reject();
    const path = resolve(root, pathname === '/' ? 'index.html' : '.' + pathname);
    if (!path.startsWith(root + sep)) return reject();
    try {
      if (!(await stat(path)).isFile()) return reject();
      const bytes = await readFile(path);
      const type = { '.html': 'text/html', '.js': 'text/javascript', '.css': 'text/css' }[extname(path)];
      if (!type) return reject();
      res.writeHead(200, { 'Content-Type': type + '; charset=utf-8' }); res.end(bytes);
    } catch { reject(); }
  });
  await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
  return { origin: 'http://127.0.0.1:' + server.address().port, requests,
    close: () => new Promise(resolve => { server.close(resolve); server.closeAllConnections(); }) };
}
if (process.argv[1] && resolve(process.argv[1]) === fileURLToPath(import.meta.url)) {
  const server = await staticServer(); console.log(JSON.stringify({ origin: server.origin }));
  process.on('SIGTERM', () => { void server.close().then(() => process.exit(0)); });
}
