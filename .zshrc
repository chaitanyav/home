export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups

#ubuntu aliases
alias ai="sudo apt-get install"
alias aupd="sudo apt-get update"
alias aupg="sudo apt-get upgrade"
alias adupg="sudo apt-get dist-upgrade"
alias ar="sudo apt-get remove"
alias as="sudo apt-cache search"
alias aar="sudo apt-get autoremove"
alias aac="sudo apt-get autoclean"

#antigen config
source ~/.antigen.conf

~/./art
~/./fortune_teller
