export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_NO_STORE
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt CORRECT
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt BRACE_CCL
setopt MULTIOS
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
autoload -U zargs
autoload -U zmv

#ubuntu aliases
alias ai="sudo apt-get install"
alias aupd="sudo apt-get update"
alias aupg="sudo apt-get upgrade"
alias adupg="sudo apt-get dist-upgrade"
alias ar="sudo apt-get remove"
alias as="sudo apt-cache search"
alias aar="sudo apt-get autoremove"
alias aac="sudo apt-get autoclean"

# Pacman alias examples
 alias pacupg='sudo pacman -Syu'        # Synchronize with repositories and then upgrade packages that are out of date on the local system.
 alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
 alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file

# Remove the specified package(s), retaining its configuration(s) and required dependencies
 alias pacre='sudo pacman -R'

 # Remove the specified package(s), its configuration(s) and unneeded dependencies
 alias pacrem='sudo pacman -Rns'

 alias pacrep='pacman -Si'              # Display information about a given package in the repositories
 alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
 alias pacloc='pacman -Qi'              # Display information about a given package in the local database
 alias paclocs='pacman -Qs'             # Search for package(s) in the local database

 # Additional pacman alias examples
 # Update and refresh the local package and ABS databases against repositories
 alias pacupd='sudo pacman -Sy && sudo abs'

 alias pacinsd='sudo pacman -S --asdeps' # Install given package(s) as dependencies of another package
 alias pacmir='sudo pacman -Syy'  # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

#antigen config
source ~/.antigen.conf

#man page settings
#export MANPAGER=most
# Colors
default=$(tput sgr0)
red=$(tput setaf 1)
green=$(tput setaf 2)
purple=$(tput setaf 5)
orange=$(tput setaf 9)

# Less colors for man pages
export PAGER=less
# Begin blinking
export LESS_TERMCAP_mb=$red
# Begin bold
export LESS_TERMCAP_md=$orange
# End mode
export LESS_TERMCAP_me=$default
# End standout-mode
export LESS_TERMCAP_se=$default
# Begin standout-mode - info box
export LESS_TERMCAP_so=$purple
# End underline
export LESS_TERMCAP_ue=$default
# Begin underline
export LESS_TERMCAP_us=$green

# color manpages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

#git clone https://github.com/pindexis/qfc $HOME/.qfc
[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PATH=$HOME:$PATH
~/./art
~/./fortune_teller
setopt extendedglob
