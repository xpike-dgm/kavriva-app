"""Real Linux Orca + Chromium AT-SPI speech test. No virtual-reader substitution."""
from pathlib import Path
import hashlib,json,os,re,shutil,subprocess,sys,tempfile,time,wave,array
if sys.platform!='linux':
    raise SystemExit('Real Orca test requires isolated Linux Xvfb/DBus/PulseAudio; no PASS on another platform')
root=Path(__file__).resolve().parents[1]
out=Path(os.environ.get('E2_ORCA_DIR',root/'artifacts/orca')).resolve();out.mkdir(parents=True,exist_ok=True)
def command(args,**kw):return subprocess.run(args,check=True,text=True,capture_output=True,**kw)
chromium=command(['node','--input-type=module','-e',"import {chromium} from 'playwright'; console.log(chromium.executablePath())"],cwd=root).stdout.strip()
for tool in ['orca','xdotool','parec','pactl']:
    if not shutil.which(tool):raise RuntimeError('Missing actual tool: '+tool)
versions={name:command([name,'--version']).stdout.strip() for name in ['orca','node']}
versions['packages']=command(['dpkg-query','-W','orca','speech-dispatcher','speech-dispatcher-espeak-ng','pulseaudio','python3-pyatspi']).stdout
(out/'versions.json').write_text(json.dumps(versions,indent=2),encoding='utf-8')
command(['gsettings','set','org.gnome.desktop.interface','toolkit-accessibility','true'])
command(['pulseaudio','--start','--exit-idle-time=-1'])
command(['pactl','load-module','module-null-sink','sink_name=orca_fixture'])
command(['pactl','set-default-sink','orca_fixture'])
# The real speech daemon uses its installed espeak-ng module and a real PulseAudio sink.
command(['speech-dispatcher','--spawn'])
log=out/'orca-debug.log';reader_output=(out/'orca-process.log').open('w',encoding='utf-8')
reader=subprocess.Popen(['orca','--replace','--debug','--debug-file='+str(log)],stdout=reader_output,stderr=subprocess.STDOUT)
rows=[]
try:
    time.sleep(4)
    if reader.poll() is not None:raise RuntimeError('Orca process exited before any browser fixture')
    for name in ['react','angular','nuxt','svelte']:
        server=None;browser=None;recording=None;row={'name':name};rows.append(row)
        try:
            server=subprocess.Popen(['node','tests/server.mjs',name],cwd=root,stdout=subprocess.PIPE,stderr=(out/(name+'-server.stderr')).open('w'),text=True)
            origin=json.loads(server.stdout.readline())['origin'];assert origin.startswith('http://127.0.0.1:')
            start=len(log.read_text(encoding='utf-8',errors='replace')) if log.exists() else 0
            audio=out/(name+'-speech.wav')
            recording=subprocess.Popen(['parec','--device=orca_fixture.monitor','--format=s16le','--rate=16000','--channels=1','--file-format=wav',str(audio)],stdout=subprocess.DEVNULL,stderr=(out/(name+'-audio.stderr')).open('w'))
            profile=tempfile.mkdtemp(prefix='e2-orca-'+name+'-')
            browser=subprocess.Popen([chromium,'--no-sandbox','--disable-dev-shm-usage','--no-first-run','--force-renderer-accessibility','--user-data-dir='+profile,'--window-size=1440,900',origin],stdout=subprocess.DEVNULL,stderr=(out/(name+'-chromium.stderr')).open('w'))
            deadline=time.monotonic()+20;windows=[]
            while time.monotonic()<deadline:
                found=subprocess.run(['xdotool','search','--onlyvisible','--name','Kavriva'],text=True,capture_output=True)
                windows=found.stdout.split()
                if len(windows)==1:break
                time.sleep(.3)
            if len(windows)!=1:raise RuntimeError('Expected one visible fixture browser window, got '+repr(windows))
            command(['xdotool','windowfocus','--sync',windows[0]]);time.sleep(3)
            for keys in ['ctrl+Home','h','h','t','ctrl+Home']+['Tab']*8+['e']:
                command(['xdotool','key','--clearmodifiers',keys]);time.sleep(.7)
            time.sleep(2)
            text=log.read_text(encoding='utf-8',errors='replace')[start:]
            speech='\n'.join(line for line in text.splitlines() if 'SPEECH OUTPUT:' in line)
            (out/(name+'-speech.txt')).write_text(speech,encoding='utf-8')
            # These are authentic speech-output records, not accessibility-tree string matches.
            required=['İnceleme kuyruğu','Güncel bilgiyi yükle','Kayıt']
            missing=[word for word in required if word.casefold() not in speech.casefold()]
            if missing:raise AssertionError('Actual Orca speech labels absent: '+repr(missing))
            recording.terminate();recording.wait(timeout=8);recording=None
            with wave.open(str(audio),'rb') as wav:
                assert wav.getsampwidth()==2 and wav.getnchannels()==1
                samples=array.array('h',wav.readframes(wav.getnframes()));duration=len(samples)/wav.getframerate()
            peak=max(map(abs,samples),default=0)
            if duration<1 or peak<100:raise AssertionError('Actual audio recording absent or silent')
            row.update(result='PASS',speechSHA256=hashlib.sha256(speech.encode()).hexdigest(),audioSHA256=hashlib.sha256(audio.read_bytes()).hexdigest(),audioBytes=audio.stat().st_size,audioSeconds=duration,audioPeak=peak,reader='Actual installed Orca speech daemon and Chromium AT-SPI; no human pronunciation/usability verdict inferred')
        except Exception as error:row.update(result='FAIL',error=str(error))
        finally:
            for process in [recording,browser,server]:
                if process and process.poll() is None:
                    process.terminate()
                    try:process.wait(timeout=8)
                    except subprocess.TimeoutExpired:process.kill();process.wait()
            (out/'results.json').write_text(json.dumps({'versions':versions,'candidates':rows},ensure_ascii=False,indent=2),encoding='utf-8')
            print(name,row,flush=True)
finally:
    reader.terminate()
    try:reader.wait(timeout=8)
    except subprocess.TimeoutExpired:reader.kill();reader.wait()
    reader_output.close()
if len(rows)!=4 or any(row['result']!='PASS' for row in rows):raise SystemExit(1)
