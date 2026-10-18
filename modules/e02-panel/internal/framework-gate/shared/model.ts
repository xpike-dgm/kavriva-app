// Isolated fixture only. Recovery references never establish identity or authorization.
export type Row = {id:string; title:string; status:string; scope:string; version:number; source:string};
export type Snapshot = {state:string; rows:Row[]; page:number; total:number; selected:Row|null; message:string; operation:string|null; result:string; file:string; note:string; formEpoch:number};
type Recovery = {version:1; kind:'idle'} | {version:1; kind:'operation'; id:string} | {version:1; kind:'logout'};
const recoveryKey='kavriva.fixture.recovery.v1';
const initial = ():Snapshot => ({state:'loading',rows:[],page:0,total:0,selected:null,message:'Güncel deneme verisi bekleniyor.',operation:null,result:'',file:'',note:'',formEpoch:0});
export function workspace() {
 let current=initial();const listeners=new Set<(s:Snapshot)=>void>();let generation=0;let signingOut=false;
 const emit=(patch:Partial<Snapshot>)=>{if(patch.state&&!['ready','submitting','outcome-unknown'].includes(patch.state)){patch={...patch,note:'',file:patch.file||'',result:patch.result||'',operation:null,formEpoch:current.formEpoch+1};}current={...current,...patch};listeners.forEach(f=>f(current));};
 function readRecovery():Recovery {
  const raw=sessionStorage.getItem(recoveryKey);let value:Recovery={version:1,kind:'idle'};
  if(raw!==null){
   if(raw.length>200)throw Error('INVALID_RECOVERY');
   const parsed=JSON.parse(raw);const keys=Object.keys(parsed).sort().join(',');
   if(parsed.version!==1||!['idle','operation','logout'].includes(parsed.kind)||keys!==(parsed.kind==='operation'?'id,kind,version':'kind,version'))throw Error('INVALID_RECOVERY');
   if(parsed.kind==='operation'&&(typeof parsed.id!=='string'||!/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/.test(parsed.id)))throw Error('INVALID_RECOVERY');
   value=parsed;
  }
  // A failed persistence probe closes the fixture before loading private data or sending effects.
  sessionStorage.setItem(recoveryKey,JSON.stringify(value));return value;
 }
 const saveRecovery=(value:Recovery)=>sessionStorage.setItem(recoveryKey,JSON.stringify(value));
 const idle=()=>saveRecovery({version:1,kind:'idle'});
 const storageClosed=()=>emit({state:'error',rows:[],selected:null,total:0,message:'İşlem takip kaydı doğrulanamadı. Ayrıntılar ve yeni işlemler kapalı; destek yolunu kullanın.'});
 async function request(path:string,options?:RequestInit) {
  const response=await fetch(path,{...options,credentials:'same-origin',cache:'no-store',headers:{'Content-Type':'application/json','X-Fixture-Only':'1',...options?.headers}});
  if(response.headers.get('X-Fixture-Contract')!=='1')throw new Error('INCOMPATIBLE_ARTIFACT');
  const body=await response.json();if(!response.ok)throw new Error(response.status===403?'DENIED':body.reason||'İşlem reddedildi');return body;
 }
 async function load(page=0) {
  let recovery:Recovery;try{recovery=readRecovery();}catch{storageClosed();return;}
  if(recovery.kind==='logout'||signingOut){emit({state:'logout-unknown',rows:[],selected:null,total:0,message:'Çıkış doğrulanmadı. Özel görünüm kapalı; güvenli çıkışı yeniden deneyin.'});return;}
  if(recovery.kind==='operation'){emit({state:'outcome-unknown',operation:recovery.id,result:'Önceki isteğin sonucu bilinmiyor. Aynı işlem kimliğiyle durumu sorgulayın; yeni işlem göndermeyin.'});return;}
  const token=++generation;emit({state:'loading',rows:[],selected:null,total:0,result:'',operation:null,file:'',message:'Güncel deneme verisi bekleniyor.'});
  try{const data=await request('/api/workspace?page='+page);if(token!==generation)return;emit({...data,page,selected:data.rows[0]||null,message:data.message||'Örnek veriler güncel. Gerçek ürün verisi değildir.'});}
  catch{if(token===generation)emit({state:'error',rows:[],selected:null,total:0,message:'Bilgiler alınamadı. Kayıt ayrıntıları kapalı. Yeniden yükleyin veya destek yolunu kullanın.'});}
 }
 async function command() {
  if(current.state!=='ready'||!current.selected||current.operation||signingOut)return;
  try{if(readRecovery().kind!=='idle'){await load();return;}}catch{storageClosed();return;}
  const resource=current.selected,note=current.note,token=generation,id=crypto.randomUUID();
  try{saveRecovery({version:1,kind:'operation',id});}catch{storageClosed();return;}
  emit({state:'submitting',operation:id,result:'Taslak isteği gönderiliyor; henüz kaydedildiği doğrulanmadı.'});
  try{const result=await request('/api/commands',{method:'POST',body:JSON.stringify({id,resource:resource.id,version:resource.version,note})});if(token===generation){idle();emit({state:'ready',result:result.message});}}
  catch(error){if(token!==generation)return;if(error instanceof Error&&error.message==='DENIED'){try{idle();}catch{}emit({state:'denied',rows:[],selected:null,total:0,message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı; yeni işlem gönderilmedi.',result:'İşlem reddedildi.'});return;}emit({state:'outcome-unknown',result:'Yanıt alınamadı; sonuç bilinmiyor. Aynı işlem kimliğiyle durumu sorgulayın; yeni işlem göndermeyin.'});}
 }
 async function lookup() {
  if(!current.operation||signingOut)return;const token=generation,id=current.operation;
  try{const data=await request('/api/status/'+encodeURIComponent(id));if(token===generation){idle();emit({result:data.message,state:data.state});}}
  catch(error){if(token!==generation)return;if(error instanceof Error&&error.message==='DENIED'){try{idle();}catch{}emit({state:'denied',rows:[],selected:null,total:0,file:'',message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı.',result:'Durum bilgisine erişim reddedildi.'});return;}emit({state:'outcome-unknown',result:'Durum doğrulanamadı. Yeni işlem göndermeyin. Destek yolunu kullanın.'});}
 }
 async function quarantine(file:File) {
  if(current.state!=='ready'||!current.selected||current.operation||signingOut)return;const token=generation,resource=current.selected.id;
  try{const data=await request('/api/files',{method:'POST',body:JSON.stringify({name:file.name,type:file.type,content:await file.text(),resource})});if(token===generation)emit({file:data.message});}
  catch(error){if(token!==generation)return;if(error instanceof Error&&error.message==='DENIED'){emit({state:'denied',rows:[],selected:null,total:0,file:'Dosya alınmadı.',message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı.'});return;}emit({file:'Dosya alınamadı. Önizleme ve yayın kapalı; yeniden kontrol edin.'});}
 }
 async function clear() {
  if(signingOut)return;const token=++generation;signingOut=true;
  emit({...initial(),state:'logging-out',message:'Özel görünüm kapatıldı. Sunucu çıkışı henüz doğrulanmadı.'});
  try{saveRecovery({version:1,kind:'logout'});await request('/api/logout',{method:'POST',body:'{}'});if(token===generation){idle();emit({state:'denied',message:'Deneme oturumu kapatıldı. Özel kayıtlar temizlendi.'});}}
  catch{if(token===generation)emit({state:'logout-unknown',message:'Çıkış doğrulanmadı. Özel görünüm kapalı; güvenli çıkışı yeniden deneyin.'});}
  finally{signingOut=false;}
 }
 return {subscribe(f:(s:Snapshot)=>void){listeners.add(f);f(current);return()=>{listeners.delete(f);};},load,
 setNote(note:string){if(current.state==='ready'&&!current.operation)emit({note});},
 select(id:string){if(current.state!=='ready'||current.operation)return;emit({selected:current.rows.find(r=>r.id===id)||null,file:'',result:''});},command,lookup,quarantine,clear};
}
export const emptySnapshot=initial;
