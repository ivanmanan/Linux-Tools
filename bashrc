function emac() {
  emacs25 -nw -q "$1" --eval '(setq buffer-read-only t)'
}

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

BLACK="\[\e[1;30m\]"
GREEN="\[\e[0;32m\]"
NO_COLOUR="\[\033[0m\]"
if [ "$(uname)" == "Darwin" ]; then
  PS1="$BLACK\w:$GREEN\$(parse_git_branch)$NO_COLOUR "
fi

# Git Autocomplete - useful for branches
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

function helm-toggle() {
  if [ -z "$1" ]; then
    echo "helm client and Tiller (server side) versions always must match. Simply toggle between different Helm versions installed by brew".
    echo
    echo "Usage: helm-toggle <Helm version>"
    echo
    echo "installed helm versions are:"
    brew info --json=v1  kubernetes-helm | jq .[].installed[].version
    echo "current helm version is:"
    brew info --json=v1  kubernetes-helm | jq .[].linked_keg
  else
    brew switch kubernetes-helm $1 > /dev/null # no appropriate error handling here if someone sets something silly
  fi
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
alias disk="df -h /dev/nvme0n1p2"
alias speed='time'
alias time='date +%r'

# Command is for GIMP 2.10.8
alias gimp="flatpak run org.gimp.GIMP//stable"

# Flutter - Need to change directory path name on different computers
export PATH="$PATH:/home/ivan/mobile/android-studio/bin"
export PATH="$PATH:/home/ivan/mobile/flutter/bin"

# Maven
export M2_HOME=/usr/local/Cellar/maven/3.6.1/libexec
export M2=$M2_HOME/bin
export PATH=$PATH:$M2_HOME/bin

if [ "$(uname)" == "Darwin" ]; then
  export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi