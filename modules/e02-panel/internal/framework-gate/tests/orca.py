"""Real Linux Orca + Chromium AT-SPI speech test. No virtual-reader substitution."""
from pathlib import Path
import hashlib,json,os,re,shutil,subprocess,sys,tempfile,time,wave,array
if sys.platform!='linux':
    raise SystemExit('Real Orca test requires isolated Linux Xvfb/DBus/PulseAudio; no PASS on another platform')
import pyatspi
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
if not any('\torca_fixture\t' in line for line in command(['pactl','list','short','sinks']).stdout.splitlines()):
    command(['pactl','load-module','module-null-sink','sink_name=orca_fixture'])
command(['pactl','set-default-sink','orca_fixture'])
# The real speech daemon uses its installed espeak-ng module and a real PulseAudio sink.
command(['speech-dispatcher','--spawn'])
def accessibles():
    stack=[pyatspi.Registry.getDesktop(0)];count=0;deadline=time.monotonic()+15
    while stack:
        if count>=6000 or time.monotonic()>deadline:raise RuntimeError('Actual accessibility traversal exceeded bound')
        obj=stack.pop();count+=1
        if obj is None:continue
        yield obj
        try:stack.extend(obj.getChildAtIndex(i) for i in reversed(range(obj.childCount)))
        except Exception:continue  # Defunct transient objects cannot become positive matches.

def accessible_named(label,role):
    deadline=time.monotonic()+20
    while time.monotonic()<deadline:
        for obj in accessibles():
            try:
                if obj.getRole()==role and obj.name==label:return obj
            except Exception:continue
        time.sleep(.2)
    raise RuntimeError('Actual accessible object absent: '+label)

def exact_table_names():
    names=[]
    for obj in accessibles():
        try:
            if obj.getRole()==pyatspi.ROLE_TABLE:names.append(obj.name)
        except Exception:continue
    expected='Toplam 240 örnek kayıt; sayfada en fazla 20'
    if names!=[expected]:raise AssertionError('Live AT-SPI table name is not the single current caption: '+repr(names))
    return names

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
            phases=[]
            for phase in ['initial','revisited','next-page']:
                if phase=='next-page':
                    button=accessible_named('Sonraki sayfa',pyatspi.ROLE_PUSH_BUTTON)
                    if not button.queryAction().doAction(0):raise AssertionError('Actual AT-SPI next-page action failed')
                    accessible_named('OBJ-0021',pyatspi.ROLE_PUSH_BUTTON)
                else:accessible_named('OBJ-0001',pyatspi.ROLE_PUSH_BUTTON)
                names=exact_table_names()
                phase_start=len(log.read_text(encoding='utf-8',errors='replace'))
                table_event=None
                for keys in ['ctrl+Home','h','h','t','ctrl+Home']+['Tab']*8+['e']:
                    event_start=len(log.read_text(encoding='utf-8',errors='replace'))
                    command(['xdotool','key','--clearmodifiers',keys]);time.sleep(.7)
                    if keys=='t':
                        time.sleep(1)
                        event_text=log.read_text(encoding='utf-8',errors='replace')[event_start:]
                        table_event='\n'.join(line for line in event_text.splitlines() if 'SPEECH OUTPUT:' in line)
                        (out/(name+'-'+phase+'-table-event.txt')).write_text(table_event,encoding='utf-8')
                        # One actual navigation action may emit multiple speech records.
                        # Never deduplicate them: a repeated caption is a real failure.
                        mentions=table_event.count('Toplam 240 örnek kayıt')
                        if mentions!=1 or 'Toplam 0 örnek kayıt' in table_event:
                            raise AssertionError('Single table navigation must announce the current count exactly once: '+phase+' mentions='+str(mentions))
                time.sleep(1)
                phase_text=log.read_text(encoding='utf-8',errors='replace')[phase_start:]
                phase_speech='\n'.join(line for line in phase_text.splitlines() if 'SPEECH OUTPUT:' in line)
                (out/(name+'-'+phase+'-speech.txt')).write_text(phase_speech,encoding='utf-8')
                if 'Toplam 240 örnek kayıt' not in phase_speech:raise AssertionError('Current caption not actually spoken: '+phase)
                if 'Toplam 0 örnek kayıt' in phase_speech or re.search(r'Toplam 240[^\n]*Toplam (?:0|240)',phase_speech):raise AssertionError('Stale or duplicated table count actually spoken: '+phase)
                if table_event is None:raise AssertionError('Actual table navigation event missing')
                phases.append({'phase':phase,'tableNames':names,'speechSHA256':hashlib.sha256(phase_speech.encode()).hexdigest(),'tableEventSpeechSHA256':hashlib.sha256(table_event.encode()).hexdigest(),'tableEventCountMentions':1})
            row['phases']=phases
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
