emac() {
    emacs25 -nw -q "$1" --eval '(setq buffer-read-only t)'
}

alias open='xdg-open'
alias emacs='emacs &'
alias chromium='chromium-browser &'
alias ram='free -m'
alias spotify='spotify --force-device-scale-factor=1.75 &'
alias firefox='firefox &'
alias google-chrome='google-chrome &'
alias react='create-react-app'
alias g11='g++ -fsanitize=address -fsanitize=undefined -fno-omit-frame-pointer -fsanitize=bounds -std=c++11 -Wall -Wextra -Wno-sign-compare -Werror=return-type -pedantic'
alias raspberry='rdesktop -g 1440x840 -u "ivan" 169.232.121.25'
alias lnxraspberry='ssh ivan@192.168.0.50'
alias battery="acpi"
alias grave='echo -n "\`" | xclip -selection clipboard'
alias disk="df -h /dev/nvme0n1p7"

# NOTE: Command is for GIMP 2.10.8
alias gimp="flatpak run org.gimp.GIMP//stable"

# NOTE: Need to change directory path name on different computers
export PATH="$PATH:/home/ivan/mobile/android-studio/bin"
export PATH="$PATH:/home/ivan/mobile/flutter/bin"

