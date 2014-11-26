export TERM="xterm-256color"

# Lines configured by zsh-newuser-install
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt correctall
setopt autocd
setopt extendedglob
setopt BRACE_CCL
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

~/./art
~/./fortune_teller
