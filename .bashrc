# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# Version Date 20220608
# Ansible copied file .bashrc

alias s-v='echo ".bashrc Version 20220608"'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi

# # set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
#     xterm-color|*-256color) color_prompt=yes;;
# esac

# # uncomment for a colored prompt, if the terminal has the capability; turned
# # off by default to not distract the user: the focus in a terminal window
# # should be on the output of commands, not on the prompt
# force_color_prompt=yes

# if [ -n "$force_color_prompt" ]; then
#     if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#         # We have color support; assume it's compliant with Ecma-48
#         # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#         # a case would tend to support setf rather than setaf.)
#         color_prompt=yes
#     else
#         color_prompt=
#     fi
# fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Check for local .aliases file and load if present
LALIASE=~/.aliases
if [ -f "$LALIASE" ]; then
  source "$LALIASE"
fi

# disable flow control CTRL-S CTRL-Q
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#clear
printf "\n"
printf "   %s\n" "Date:          $(date)"
# Check Internet status 
case "$(curl -s --max-time 2 -I http://google.com | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) printf "   %s\n" "Internet IP:   $(curl -s ipinfo.io/ip)";;
  5) printf "   %s\n" "Internet IP:   Proxy Block";;
  *) printf "   %s\n" "Internet IP:   Internet Offline";;
esac
printf "   %s\n" "OS Distro:     $_disto"
if [ "$OS" != "Windows_NT" ]; then
  printf "   %s\n" "User:          $(echo $USER)"
  printf "   %s\n" "Uptime:        $(uptime -p)"
  printf "   %s\n" "Hostname:      $(hostname -f)"
  printf "   %s\n" "Kernel:        $(uname -rms)"
  printf "   %s\n" "Packages:      $(dpkg --get-selections | wc -l)"
  printf "   %s\n" "Memory:        $(free -m -h | awk '/Mem/{print $3"/"$2}')"
else
  printf "   %s\n" "User:          $USERNAME"
fi
printf "   %s\n" ".bashrc:       $(s-v)"
printf "   %s\n" ".bash_aliases: $(a-v)"
printf "\n"

# Enable zoxide
eval "$(zoxide init bash)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Starship as prompt https://starship.rs/
eval "$(starship init bash)"

. "$HOME/.cargo/env"
