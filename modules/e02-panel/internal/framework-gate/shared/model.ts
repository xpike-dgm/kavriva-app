// This transport and state are for isolated comparison fixtures only, never product authority.
export type Row = {id:string; title:string; status:string; scope:string; version:number; source:string};
export type Snapshot = {state:string; rows:Row[]; page:number; total:number; selected:Row|null; message:string; operation:string|null; result:string; file:string};
const initial = ():Snapshot => ({state:'loading',rows:[],page:0,total:0,selected:null,message:'Güncel deneme verisi bekleniyor.',operation:null,result:'',file:''});
export function workspace() {
 let current=initial(); const listeners=new Set<(s:Snapshot)=>void>(); let generation=0;
 const emit=(patch:Partial<Snapshot>)=>{current={...current,...patch};listeners.forEach(f=>f(current));};
 async function request(path:string,options?:RequestInit) {
  const response=await fetch(path,{...options,credentials:'same-origin',cache:'no-store',headers:{'Content-Type':'application/json','X-Fixture-Only':'1',...options?.headers}});
  if(response.headers.get('X-Fixture-Contract')!=='1')throw new Error('INCOMPATIBLE_ARTIFACT');
  const body=await response.json();if(!response.ok)throw new Error(response.status===403?'DENIED':body.reason||'İşlem reddedildi');return body;
 }
 async function load(page=0) {
  const token=++generation;emit({state:'loading',rows:[],selected:null,result:'',operation:null,file:'',message:'Güncel deneme verisi bekleniyor.'});
  try {const data=await request('/api/workspace?page='+page);if(token!==generation)return;
   emit({...data,page,selected:data.rows[0]||null,message:data.message||'Örnek veriler güncel. Gerçek ürün verisi değildir.'});
  }catch {if(token===generation)emit({state:'error',rows:[],selected:null,message:'Bilgiler alınamadı. Kayıt ayrıntıları kapalı. Yeniden yükleyin veya destek yolunu kullanın.'});}
 }
 async function command(note:string) {
  if(current.state!=='ready'||!current.selected||current.operation)return;
  const resource=current.selected; const token=generation; const id=crypto.randomUUID();
  emit({operation:id,result:'Taslak isteği gönderiliyor; henüz kaydedildiği doğrulanmadı.'});
  try {const result=await request('/api/commands',{method:'POST',body:JSON.stringify({id,resource:resource.id,version:resource.version,note})});
   if(token===generation)emit({result:result.message});
  }catch(error) {if(token===generation&&error instanceof Error&&error.message==='DENIED'){emit({state:'denied',rows:[],selected:null,message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı; yeni işlem gönderilmedi.',result:'İşlem reddedildi.'});return;}if(token===generation)emit({state:'outcome-unknown',result:'Yanıt alınamadı; sonuç bilinmiyor. Aynı işlem kimliğiyle durumu sorgulayın; yeni işlem göndermeyin.'});}
 }
 async function lookup() {if(!current.operation)return;const token=generation;try {const data=await request('/api/status/'+encodeURIComponent(current.operation));if(token===generation)emit({result:data.message,state:data.state});}catch(error){if(token===generation&&error instanceof Error&&error.message==='DENIED'){emit({state:'denied',rows:[],selected:null,file:'',message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı.',result:'Durum bilgisine erişim reddedildi.'});return;}if(token===generation)emit({result:'Durum doğrulanamadı. Yeni işlem göndermeyin. Destek yolunu kullanın.'});}}
 async function quarantine(file:File) {if(current.state!=='ready'||!current.selected)return;const token=generation;
  try {const data=await request('/api/files',{method:'POST',body:JSON.stringify({name:file.name,type:file.type,content:await file.text(),resource:current.selected.id})});if(token===generation)emit({file:data.message});}
  catch(error) {if(token===generation&&error instanceof Error&&error.message==='DENIED'){emit({state:'denied',rows:[],selected:null,file:'Dosya alınmadı.',message:'Güncel izin reddedildi. Özel ayrıntılar kapatıldı.'});return;}if(token===generation)emit({file:'Dosya alınamadı. Önizleme ve yayın kapalı; yeniden kontrol edin.'});}
 }
 return {subscribe(f:(s:Snapshot)=>void){listeners.add(f);f(current);return()=>{listeners.delete(f);};},load,
 select(id:string){if(current.state!=='ready'||current.operation)return;emit({selected:current.rows.find(r=>r.id===id)||null,file:'',result:''});},command,lookup,quarantine,
 clear(){++generation;void request('/api/logout',{method:'POST',body:'{}'}).catch(()=>{});emit({...initial(),state:'denied',message:'Deneme oturumu kapatıldı. Özel kayıtlar temizlendi.'});}};
}
export const emptySnapshot=initial;
