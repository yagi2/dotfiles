set ANDROID_SDK $HOME/Library/Android/sdk
set ANDROID_HOME $HOME/Library/Android/sdk
set GOPATH $HOME
set JAVA_HOME (/usr/libexec/java_home -v "11")
set PATH $HOME/Library/Android/sdk/platform-tools $HOME/Library/Android/sdk/tools $HOME/bin $GOPATH/bin /usr/local/opt/openjdk@11/bin $HOME/fvm/default/bin $HOME/.pub-cache/bin $HOME/nodenv/bin $PATH
set EDITOR /usr/local/bin/micro
set LESSOPEN '| /usr/local/bin/src-hilite-lesspipe.sh %s'
set LESS '-R'
set -gx theme_nerd_fonts yes

# for java
fish_add_path /usr/local/opt/openjdk@8/bin

# for rbenv
status --is-interactive; and source (rbenv init -|psub)

eval (gh completion -s fish | source)

# for nodenv
eval (nodenv init - | source)


alias ps='procs'
alias cat='bat'
alias ls='exa --icons'
alias g='git'
alias flt='flutter'

function hs
  if test (count $argv) = 0
    set peco_flags --layout=bottom-up
  else
    set peco_flags --layout=bottom-up --query "$argv"
  end
  history|peco $peco_flags|read foo
  if [ $foo ]
    commandline $foo
  else
    commandline ''
  end
end
bind \cr hs

function gcd
    ghq list --full-path | peco --prompt "Git Repository>" | read recent
    if [ $recent ]
        cd $recent
    end
end
bind \co gcd

function ghq-create
    cd (ghq create (echo $argv)) | gh repo create (echo $argv) --public -y
    echo "# "(echo $argv) >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M master
    git remote add origin git@github.com:yagi2/(echo $argv).git
    git push -u origin master
end

function select-adb
  adb devices | sed '1d' | peco | awk '{print $1}'
end

function screenshot
  set DEVICE_ID (select-adb)
  set FILE_NAME (date "+Screenshot_%Y-%m-%d-%H-%M-%S").png
  adb -s $DEVICE_ID shell screencap -p /sdcard/$FILE_NAME
  adb -s $DEVICE_ID pull /sdcard/$FILE_NAME
  adb -s $DEVICE_ID shell rm /sdcard/$FILE_NAME
end

function screenShotiOS
  set FILE_NAME (date "+Screenshot_%Y-%m-%d-%H-%M-%S_iOS").png
  xcrun simctl io booted screenshot $FILE_NAME
end

function recordScreeniOS
  set FILE_NAME (date "+Screenshot_%Y-%m-%d-%H-%M-%S_iOS").mp4
  xcrun simctl io booted recordVideo $FILE_NAME
end

function uninstallApp
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell pm list package | sed -e 's/^package://g' | peco | xargs adb -s $DEVICE_ID uninstall
end

function installApp
  set DEVICE_ID (select-adb)
  find ./ -name "*.apk" | peco | xargs adb -s $DEVICE_ID install -r
end

function restart-adb
  adb kill-server
  adb start-server
end

function pickApp
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell pm list packages -f | sed -e 's/package:\([^=]*\).*/\1/g'| peco | xargs adb -s $DEVICE_ID pull
end

function showView
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell dumpsys activity top | less
end

function inputText
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell input text "$argv"
end

function inputTextiOS
  echo $argv | xcrun simctl pbcopy booted
end

function adb-shell
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell $argv
end

function androidReboot
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell reboot
end

function pidcatN
  set DEVICE_ID (select-adb)
  pidcat -s $DEVICE_ID
end

function pidcatP
  set DEVICE_ID (select-adb)
  set PACKAGE_ID (adb -s $DEVICE_ID shell pm list package | sed -e 's/^package://g' | peco)
  pidcat -s $DEVICE_ID $PACKAGE_ID
end

function pidcat-with-grep
  set DEVICE_ID (select-adb)
  set PACKAGE_ID (adb -s $DEVICE_ID shell pm list package | sed -e 's/^package://g' | peco)
  pidcat -s $DEVICE_ID $PACKAGE_ID | grep $argv
end

function gfxinfo
  set DEVICE_ID (select-adb)
  adb -s $DEVICE_ID shell dumpsys gfxinfo
end

function runScratch
  set SCRATCH_FILE_PATH (find $HOME/Library/Preferences/*/ -name "*.kts" | peco)
  kotlinc -script $SCRATCH_FILE_PATH
end

function activities
  adb-shell dumpsys activity activities
end

function viewLayout
  adb-shell dumpsys activity top
end

function adb-remove-app-data
  set DEVICE_ID (select-adb)
  set PACKAGE_ID (adb -s $DEVICE_ID shell pm list package | sed -e 's/^package://g' | peco)
  adb -s $DEVICE_ID shell pm clear $PACKAGE_ID
end

function cdf
  set target (osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
  if test -n $target
    cd $target
      pwd
  else
    echo 'No Finder window found' >&2
    false
  end
end

function openUrl
  adb-shell am start -a android.intent.action.VIEW -d $argv
end

function openUrliOS
  xcrun simctl openurl booted $argv
end

function addMedia
  xcrun simctl addmedia booted $argv
end

function currentActivity
  adb-shell dumpsys activity |  grep -B 1 "Run #[0-9]*:"
end

function mp3_to_ogg
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.mp3 -vn -ac 2 -ar 44100 -ab 128k -acodec libvorbis -f ogg $FILE_NAME.ogg
end

function wav_to_flac
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.wav -vn -ar 44100 -ac 2 -acodec flac -f flac $FILE_NAME.flac
end

function wav_to_mp3
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.wav -vn -ac 2 -ar 44100 -ab 256k -acodec libmp3lame -f mp3 $FILE_NAME.mp3
end

function wav_to_wma
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.wav -vn -ac 2 -ar 44100 -ab 128k -acodec wmav2 -f asf $FILE_NAME.wma
end

function wav_to_ogg
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.wav -vn -ac 2 -ar 44100 -ab 128k -acodec libvorbis -f ogg $FILE_NAME.ogg
end

function mp3_to_wav
  set FILE_NAME $argv
  ffmpeg -i $FILE_NAME.mp3 -vn -ac 2 -ar 44100 -acodec pcm_s16le -f wav $FILE_NAME.wav
end

function webm_to_mp4
  set INPUT_FILE_NAME $argv
  set OUTPUT_FILE_NAME (basename $INPUT_FILE_NAME .webm)
  ffmpeg -fflags +genpts -i $INPUT_FILE_NAME -r 24 $OUTPUT_FILE_NAME.mp4
end

# for starship
starship init fish | source