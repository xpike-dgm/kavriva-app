import {connect} from 'node:net';import {once} from 'node:events';
import {test} from 'node:test';import assert from 'node:assert/strict';import {fixtureServer} from './server.mjs';
async function fixture(t){const s=await fixtureServer();t.after(()=>s.close());const call=(path,body,extra={})=>fetch(s.origin+path,{method:body?'POST':'GET',headers:{Cookie:'fixture_session=reader-epoch-1',Origin:s.origin,'X-Fixture-Only':'1','Content-Type':'application/json',...extra},...(body?{body:JSON.stringify(body)}:{})});return {...s,call};}
const command={id:'same-operation',resource:'OBJ-0001',version:1,note:'Yalnız deneme notu'};
test('missing/current/revoked session never shares records',async t=>{const s=await fixture(t);assert.equal((await fetch(s.origin+'/api/workspace')).status,403);assert.equal((await s.call('/api/workspace')).status,200);s.state.epoch++;assert.equal((await s.call('/api/workspace')).status,403);});
test('bounded page rejects invalid range and preserves scope',async t=>{const s=await fixture(t);const a=await(await s.call('/api/workspace?page=11')).json();assert.equal(a.rows.length,20);assert.equal(a.rows[19].id,'OBJ-0240');assert.equal((await s.call('/api/workspace?page=12')).status,400);});
test('cross-origin or absent CSRF marker cannot write',async t=>{const s=await fixture(t);assert.equal((await s.call('/api/commands',command,{Origin:'https://foreign.invalid'})).status,403);assert.equal((await s.call('/api/commands',command,{'X-Fixture-Only':''})).status,403);assert.equal(s.state.writes.size,0);});
test('foreign resource, stale version and client authority rejected before audit',async t=>{const s=await fixture(t);for(const change of [{resource:'FOREIGN-1'},{version:0},{role:'admin'},{epoch:1},{resource:'OBJ-9999'}])assert.equal((await s.call('/api/commands',{...command,...change})).status,400);assert.equal(s.state.audits.length,0);assert.equal(s.state.writes.size,0);});
test('audit precedes one idempotent fixture write; mismatch rejected',async t=>{const s=await fixture(t);assert.equal((await s.call('/api/commands',command)).status,200);assert.equal((await s.call('/api/commands',command)).status,200);assert.equal(s.state.audits.length,1);assert.equal(s.state.writes.size,1);assert.equal((await s.call('/api/commands',{...command,note:'başka'})).status,409);});
test('response loss keeps same-id lookup without a second mutation',async t=>{const s=await fixture(t);s.state.dropResponse=true;await assert.rejects(s.call('/api/commands',command));const a=await(await s.call('/api/status/'+command.id)).json();assert.equal(a.state,'ready');assert.equal(s.state.writes.size,1);});
test('denied/stale views expose no rows or commands',async t=>{const s=await fixture(t);for(const v of ['denied','stale']){s.state.view=v;assert.deepEqual((await(await s.call('/api/workspace')).json()).rows,[]);assert.equal((await s.call('/api/commands',command)).status,403);}});
test('private quarantine digest; no active preview; restore never revives epoch',async t=>{const s=await fixture(t);const a=await(await s.call('/api/files',{name:'x.html',content:'<script>alert(1)</script>',resource:'OBJ-0001'})).json();assert.match(a.digest,/^[a-f0-9]{64}$/);assert.equal((await s.call('/api/files/'+a.handle+'/preview')).status,403);for(const action of ['archive','restore'])assert.equal((await s.call('/api/files/'+a.handle+'/'+action,{})).status,200);s.state.epoch++;assert.equal((await s.call('/api/files/'+a.handle+'/restore',{})).status,403);});
test('status lookup does not return a previous epoch operation',async t=>{const s=await fixture(t);await s.call('/api/commands',command);s.state.epoch=2;assert.equal((await s.call('/api/status/'+command.id,undefined,{Cookie:'fixture_session=reader-epoch-2'})).status,404);});

// A partial HTTP header must not hold an already-finished fixture run open.
test('fixture teardown closes a real incomplete HTTP connection',async()=>{
 const s=await fixtureServer();const url=new URL(s.origin);const socket=connect(Number(url.port),url.hostname);let timer;
 try{await once(socket,'connect');socket.write('GET / HTTP/1.1\r\nHost: 127.0.0.1\r\n');await new Promise(resolve=>setImmediate(resolve));const closed=new Promise((resolve,reject)=>{socket.once('close',resolve);socket.on('error',error=>{if(error.code!=='ECONNRESET')reject(error);});});await Promise.race([Promise.all([s.close(),closed]),new Promise((_,reject)=>{timer=setTimeout(()=>reject(Error('Incomplete HTTP connection blocked fixture teardown')),1000);})]);assert.equal(socket.destroyed,true);
 }finally{clearTimeout(timer);socket.destroy();await s.close();}
});


test('lost logout response is confirmed idempotently only by current cookie and origin',async t=>{
 const s=await fixture(t);s.state.dropLogoutResponse=true;await assert.rejects(s.call('/api/logout',{}));assert.equal(s.state.active,false);assert.equal((await s.call('/api/workspace')).status,403);s.state.dropLogoutResponse=false;
 for(const extra of [{Origin:'https://foreign.invalid'},{'X-Fixture-Only':''},{Cookie:'fixture_session=reader-epoch-0'}])assert.equal((await s.call('/api/logout',{},extra)).status,403);
 assert.equal((await s.call('/api/logout',{})).status,200);assert.equal(s.state.active,false);assert.equal(s.state.writes.size,0);assert.equal(s.state.audits.length,0);
});
