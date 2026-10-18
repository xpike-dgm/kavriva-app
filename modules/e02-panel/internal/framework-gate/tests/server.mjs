import {fileURLToPath} from 'node:url';
// Isolated localhost comparison server. No real identities, secrets, storage or E3/E5 authority.
import {createServer} from 'node:http';
import {readFile,stat} from 'node:fs/promises';
import {resolve,sep,extname} from 'node:path';
import {createHash} from 'node:crypto';
export async function fixtureServer(artifact) {
 const state={view:'ready',epoch:1,active:true,dropResponse:false,contract:'1',audits:[],writes:new Map(),files:new Map()};
 const root=artifact?resolve(artifact):null;
 const scriptHashes=[],styleHashes=[];
 if(root){for(const name of ['index.html','200.html']){try{const html=await readFile(resolve(root,name),'utf8');for(const [tag,list] of [['script',scriptHashes],['style',styleHashes]]){for(const match of html.matchAll(new RegExp(`<${tag}\\b([^>]*)>([\\s\\S]*?)<\\/${tag}>`,'gi'))){if(!/\bsrc\s*=/.test(match[1])&&match[2])list.push("'sha256-"+createHash('sha256').update(match[2]).digest('base64')+"'");}}}catch{}}}
 // Exact SvelteKit3.1.0 announcer style; no arbitrary inline styles or scripts.
 const announcerStyle='position: absolute; left: 0; top: 0; clip: rect(0 0 0 0); clip-path: inset(50%); overflow: hidden; white-space: nowrap; width: 1px; height: 1px';
 const announcerHash=createHash('sha256').update(announcerStyle).digest('base64');
 const csp=`default-src 'none'; script-src 'self' ${[...new Set(scriptHashes)].join(' ')}; style-src 'self' ${[...new Set(styleHashes)].join(' ')}; style-src-attr 'unsafe-hashes' 'sha256-${announcerHash}'; connect-src 'self'; img-src 'self' data:; font-src 'self'; base-uri 'self'; form-action 'self'; frame-ancestors 'none'; object-src 'none'`;
 const server=createServer(async(req,res)=>{
  res.setHeader('X-Fixture-Contract',state.contract);res.setHeader('Cache-Control','private, no-store');res.setHeader('Content-Security-Policy',csp);res.setHeader('X-Content-Type-Options','nosniff');res.setHeader('Referrer-Policy','no-referrer');
  const json=(code,data)=>{res.writeHead(code,{'Content-Type':'application/json; charset=utf-8'});res.end(JSON.stringify(data));};
  try{
   const url=new URL(req.url,'http://127.0.0.1');
   if(url.pathname.startsWith('/api/')){
    const authenticated=state.active&&req.headers.cookie==='fixture_session=reader-epoch-'+state.epoch;
    if(!authenticated)return json(403,{reason:'SESSION_NOT_CURRENT'});
    if(req.method!=='GET'&&(req.headers.origin!==origin||req.headers['x-fixture-only']!=='1'))return json(403,{reason:'ORIGIN_OR_CSRF'});
    if(req.url!==url.pathname+url.search||/%|\.\.|\/\//.test(url.pathname))return json(400,{reason:'NON_CANONICAL_PATH'});
    if(url.pathname==='/api/logout'&&req.method==='POST'){state.active=false;return json(200,{message:'Deneme oturumu kapatıldı.'});}
    if(url.pathname==='/api/workspace'&&req.method==='GET'){
     if(state.view==='error'||state.view==='offline')return json(503,{reason:'FIXTURE_UNAVAILABLE'});
     const page=Number(url.searchParams.get('page')||0);if(!Number.isInteger(page)||page<0||page>11)return json(400,{reason:'PAGE_RANGE'});
     if(state.view!=='ready')return json(200,{state:state.view,rows:[],total:0,message:{denied:'İzin doğrulanmadı. Ayrıntılar ve işlemler kapalı. Güncel bilgiyi yükleyin.',stale:'Oturum bilgisi eski. Ayrıntılar kapalı. Güncel bilgiyi yükleyin.',empty:'İncelenecek kayıt yok. Diğer çalışma alanına geçebilirsiniz.',loading:'Güncel kayıtlar bekleniyor. İşlem kapalı.'}[state.view]||'Bilgi doğrulanamadı.'});
     const rows=Array.from({length:20},(_,i)=>{const n=page*20+i+1;return {id:'OBJ-'+String(n).padStart(4,'0'),title:n===2?'<img src=x onerror="window.fixtureXss=true">':'Örnek kapsamı ve kaynak ilişkilendirmesi için uzun Türkçe inceleme başlığı '+n,status:'İnceleme bekliyor',scope:'Örnek motosiklet · 2026 · TR',version:1,source:'Örnek kaynak '+n};});
     return json(200,{state:'ready',rows,total:240,message:'Örnek veriler güncel. Gerçek ürün verisi değildir.'});
    }
    if(url.pathname==='/api/commands'&&req.method==='POST'){
     const data=await body(req);if(state.view!=='ready')return json(403,{reason:'CURRENT_ROLE_OR_SCOPE_REQUIRED'});
     if(!data.id||!/^OBJ-\d{4}$/.test(data.resource)||Number(data.resource.slice(4))<1||Number(data.resource.slice(4))>240||data.version!==1||typeof data.note!=='string'||!data.note.trim()||data.note.length>1200)return json(400,{reason:'EXACT_RESOURCE_VERSION_NOTE_REQUIRED'});
     if(Object.keys(data).sort().join(',')!=='id,note,resource,version')return json(400,{reason:'CLIENT_AUTHORITY_REJECTED'});
     const fingerprint=JSON.stringify([data.resource,data.version,data.note]);const old=state.writes.get(data.id);
     if(old&&old.fingerprint!==fingerprint)return json(409,{reason:'IDEMPOTENCY_MISMATCH'});
     if(!old){state.audits.push({id:data.id,resource:data.resource,epoch:state.epoch});state.writes.set(data.id,{fingerprint,epoch:state.epoch,message:'Deneme taslağı kaydedildi. Yayın veya gerçek ürün işlemi yapılmadı.',state:'ready'});}
     if(state.dropResponse){res.destroy();return;}return json(200,state.writes.get(data.id));
    }
    if(url.pathname.startsWith('/api/status/')&&req.method==='GET'){
     const value=state.writes.get(url.pathname.slice('/api/status/'.length));
     if(!value||value.epoch!==state.epoch)return json(404,{reason:'NO_CURRENT_SCOPED_OPERATION'});
     return json(200,value);
    }
    if(url.pathname==='/api/files'&&req.method==='POST'){
     if(state.view!=='ready')return json(403,{reason:'CURRENT_ROLE_OR_SCOPE_REQUIRED'});
     const data=await body(req);if(typeof data.content!=='string'||data.content.length>65536||(!/^OBJ-\d{4}$/.test(data.resource)||Number(data.resource.slice(4))<1||Number(data.resource.slice(4))>240))return json(400,{reason:'FILE_INPUT_REJECTED'});
     const digest=createHash('sha256').update(data.content).digest('hex');const handle='quarantine-'+digest;
     state.files.set(handle,{digest,epoch:state.epoch,archived:false,content:data.content});
     return json(200,{handle,digest,message:'Dosya özel karantinada; SHA256 '+digest+'. Etkin önizleme ve yayın kapalı.'});
    }
    const match=url.pathname.match(/^\/api\/files\/(quarantine-[a-f0-9]{64})\/(preview|archive|restore)$/);
    if(match){const file=state.files.get(match[1]);if(!file||file.epoch!==state.epoch)return json(404,{reason:'SCOPED_HANDLE_REQUIRED'});
     if(match[2]==='preview')return json(403,{reason:'ACTIVE_PREVIEW_HELD'});
     if(req.method!=='POST')return json(405,{reason:'METHOD_REJECTED'});
     if(state.view!=='ready')return json(403,{reason:'CURRENT_ROLE_REQUIRED'});
     file.archived=match[2]==='archive';return json(200,{archived:file.archived,message:'Yalnız deneme arşiv durumu değişti; izin verilmedi.'});}
    return json(404,{reason:'UNKNOWN_API_ROUTE'});
   }
   if(req.method!=='GET'||!root)return json(404,{reason:'NOT_FOUND'});
   if(/%|\.\.|\/\//.test(req.url)||url.pathname.split('/').some(x=>x.startsWith('.')))return json(404,{reason:'STATIC_PATH_REJECTED'});
   let path=resolve(root,'.'+url.pathname);if(path!==root&&!path.startsWith(root+sep))return json(404,{reason:'STATIC_PATH_REJECTED'});
   if(path===root){try{await stat(resolve(root,'index.html'));path=resolve(root,'index.html');}catch{path=resolve(root,'200.html');}}
   let bytes;try{if(!(await stat(path)).isFile())throw Error();bytes=await readFile(path);}catch{if(extname(url.pathname))return json(404,{reason:'ASSET_NOT_FOUND'});try{path=resolve(root,'index.html');bytes=await readFile(path);}catch{path=resolve(root,'200.html');bytes=await readFile(path);}}
   if(extname(path)==='.html')res.setHeader('Set-Cookie','fixture_session=reader-epoch-'+state.epoch+'; HttpOnly; SameSite=Strict; Path=/');
   const types={'.html':'text/html','.js':'text/javascript','.css':'text/css','.json':'application/json','.svg':'image/svg+xml','.ico':'image/x-icon'};
   res.writeHead(200,{'Content-Type':(types[extname(path)]||'application/octet-stream')+'; charset=utf-8'});res.end(bytes);
  }catch(error){if(!res.destroyed)json(400,{reason:'FIXTURE_BAD_REQUEST'});}
 });
 await new Promise(resolve=>server.listen(0,'127.0.0.1',resolve));const origin='http://127.0.0.1:'+server.address().port;
 return {origin,state,csp,close:()=>new Promise(resolve=>server.close(resolve))};
}
async function body(req){let text='';for await(const chunk of req){text+=chunk;if(text.length>70000)throw Error('bounded body');}return JSON.parse(text);}

// Optional CLI for a real assistive-technology fixture process, never a deployment entry point.
if(process.argv[1]&&resolve(process.argv[1])===fileURLToPath(import.meta.url)){
 const artifacts={react:'dist',angular:'dist/browser',nuxt:'.output/public',svelte:'build'};
 const name=process.argv[2];if(!Object.hasOwn(artifacts,name))throw Error('Known fixture candidate required');
 const root=resolve(fileURLToPath(new URL('../',import.meta.url)),name,artifacts[name]);
 const fixture=await fixtureServer(root);console.log(JSON.stringify({origin:fixture.origin,candidate:name}));
 process.on('SIGTERM',()=>{void fixture.close().then(()=>process.exit(0));});
}
