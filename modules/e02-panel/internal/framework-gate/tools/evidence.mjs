import {readFile,writeFile,mkdir,readdir} from 'node:fs/promises';import {resolve} from 'node:path';import {fileURLToPath} from 'node:url';import {createHash} from 'node:crypto';import {gzipSync} from 'node:zlib';import {spawnSync} from 'node:child_process';
const root=fileURLToPath(new URL('../',import.meta.url));const out=resolve(process.env.E2_EVIDENCE_DIR||root+'/artifacts/dependencies');await mkdir(out,{recursive:true});
const npm=process.env.E2_NPM_CLI||process.env.npm_execpath;if(!npm)throw Error('Use npm run evidence or provide exact E2_NPM_CLI');
const result={at:new Date().toISOString(),node:process.version,npm:spawnSync(process.execPath,[npm,'--version'],{encoding:'utf8'}).stdout.trim(),fixtureOnly:true,candidates:[]};
const builds={react:'dist',angular:'dist/browser',nuxt:'.output/public',svelte:'build'};
async function files(dir){const out=[];for(const e of await readdir(dir,{withFileTypes:true})){if(e.isDirectory())out.push(...await files(resolve(dir,e.name)));else if(e.isFile())out.push(resolve(dir,e.name));}return out;}
for(const [name,artifact]of Object.entries(builds)){
 const cwd=resolve(root,name),lockBytes=await readFile(resolve(cwd,'package-lock.json'));const lock=JSON.parse(lockBytes);const row={name,lockSHA256:createHash('sha256').update(lockBytes).digest('hex'),dependencies:[],commands:[],artifacts:[]};
 for(const [path,data]of Object.entries(lock.packages))if(path){row.dependencies.push({path,name:data.name||path.split('node_modules/').at(-1),version:data.version,integrity:data.integrity||null,license:data.license||null,dev:!!data.dev,optional:!!data.optional,engines:data.engines||null});}
 for(const [label,args]of [['dependency-tree',['ls','--all','--json']],['sbom',['sbom','--sbom-format','cyclonedx','--package-lock-only']],['audit',['audit','--json']]]){
  const run=spawnSync(process.execPath,[npm,...args],{cwd,encoding:'utf8',maxBuffer:24*1024*1024});const output=run.stdout||'';const path=resolve(out,name+'-'+label+'.json');await writeFile(path,output);await writeFile(resolve(out,name+'-'+label+'.stderr.txt'),run.stderr||'');row.commands.push({label,status:run.status,signal:run.signal,error:run.error?.message||null,path,bytes:Buffer.byteLength(output),sha256:createHash('sha256').update(output).digest('hex')});
 }
 for(const file of await files(resolve(cwd,artifact))){const bytes=await readFile(file);row.artifacts.push({path:file.slice(resolve(cwd,artifact).length+1).replaceAll('\\','/'),bytes:bytes.length,gzipBytes:gzipSync(bytes).length,sha256:createHash('sha256').update(bytes).digest('hex')});}
 row.executionErrors=row.commands.filter(x=>x.label!=='audit'&&x.status!==0);
 row.candidateVerdict='HELD';row.remainingGates=['real screen reader','actual browser zoom','major upgrade and guarded recovery','support horizon and cost','independent review and superseding ADR'];
 if(row.executionErrors.length)process.exitCode=1;
 row.totalBytes=row.artifacts.reduce((a,x)=>a+x.bytes,0);row.missingLicense=row.dependencies.filter(x=>!x.license).length;row.support='Exact installed engines and license metadata collected; vendor support horizon and operational cost closure still HELD';result.candidates.push(row);
 console.log(name,'packages',row.dependencies.length,'missingLicense',row.missingLicense,'bytes',row.totalBytes,'commands',row.commands.map(x=>x.label+':'+x.status).join(','));
}
await writeFile(resolve(out,'inventory.json'),JSON.stringify(result,null,2));console.log('No framework winner or production acceptance claimed.');
