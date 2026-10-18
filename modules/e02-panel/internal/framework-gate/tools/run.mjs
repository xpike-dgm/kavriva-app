import {spawnSync} from 'node:child_process';
import {fileURLToPath} from 'node:url';
const root=fileURLToPath(new URL('../',import.meta.url));
for(const name of ['react','angular','nuxt','svelte']){const result=spawnSync(process.env.npm_execpath?process.execPath:'npm',process.env.npm_execpath?[process.env.npm_execpath,'run','build']:['run','build'],{cwd:root+name,stdio:'inherit',shell:process.platform==='win32'&&!process.env.npm_execpath});if(result.status!==0)process.exit(result.status||1);}
