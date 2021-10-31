# File: .bash_aliases
# Author: John Hight
# Description: .bash_aliases for Linux systems
# Last Modified: October 31, 2021
#
# Aliases
# alias alias_name="command_to_run"
# Version Date .bash_aliases
# Ansible copied file .bash_aliases

alias a-v='echo "Version 20211031"'
# Long format list
alias ll="ls -la"
## Show hidden files ##
alias l.='ls -d .* --color=auto'
# Display the directory structure better.
alias tree='tree --dirsfirst -F'

# update dot files
alias pulldots='sudo ansible-pull -U https://github.com/jthight/memories-for-tomorrow.git local-dotfiles.yml'

# Print my public IP
alias myip='curl ipinfo.io/ip'
alias ipif='curl ipinfo.io/'

# up - up on level in directory and pwd
alias up='cd .. && pwd'

# udb - update bashrc after edit
alias udb='source ~/.bashrc && echo "~/.bashrc -- updated"'

# nb - nano edit ~/.dotfiles/.bashrc
alias nb='nano ~/.dotfiles/.bashrc'
alias vb='vim ~/.dotfiles/.bashrc'

# nba - nano edit ~/.dotfiles/.bash_aliases
alias nba='nano ~/.dotfiles/.bash_aliases'
alias vba='vim ~/.dotfiles/.bash_aliases'

# Edit .vimrc and .vimrc-sys
alias vv='vim ~/.dotfiles/.vimrc'
alias vs='vim ~/.vimrc-sys'

# Speedtest Internet speed 
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

# Useful alias
alias dirs="ls -al | grep '^d'"
alias l="ls -al"
alias lf="ls -aFG"
alias lm="ls -al|more"
alias h="history"
alias qp="ps auxwww|more"
alias nu="who|wc -l"
alias c='clear'
alias mkdir='mkdir -pv'
alias bc='bc -l'
alias a='alias'
alias al='alias | less -m'
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias lsmount='mount |column -t'
alias extip='curl icanhazip.com'
alias ipl='ip a | grep "inet " | grep -v 127.0.0.1 | awk "{print \$2}"'
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias cpu5='ps auxf | sort -nr -k 3 | head -5'

# View the calender by typing the first three letters of the month.
alias jan='cal -m 01'
alias feb='cal -m 02'
alias mar='cal -m 03'
alias apr='cal -m 04'
alias may='cal -m 05'
alias jun='cal -m 06'
alias jul='cal -m 07'
alias aug='cal -m 08'
alias sep='cal -m 09'
alias oct='cal -m 10'
alias nov='cal -m 11'
alias dec='cal -m 12'

# Control cd command behavior
## get rid of command not found ##
alias cd..='cd ..'
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias bk='cd -'
alias cd~='cd ~'
alias ~='cd ~'
alias home='cd ~'

# ports - List all open ports
alias ports='netstat -tulanp'
# ping - set ping to 5 times then stop
# alias ping='ping -c 5'
if [ "$_disto" = "ID=kali" ]; then
  if [ $_uid != "0" ]; then
    alias ping='sudo ping -c 5'
  else
    alias ping='ping -c 5'
  fi
elif [ "$_disto" = "ID=ming64" ]; then
  alias ping='ping'
else
  alias ping='ping -c 5'
fi
# paths - list all exe paths
alias paths='echo -e ${PATH//:/\\n}'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | egrep ^USER > .psmem-tmp && ps auxf | egrep -v ^USER | sort -nr -k 4 >> .psmem-tmp && less -m .psmem-tmp'
alias psmem10='ps auxf | egrep ^USER && ps auxf | egrep -v ^USER | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | egrep ^USER > .pscpu-tmp && ps auxf | egrep -v ^USER | sort -nr -k 3 >> .pscpu-tmp && less -m .pscpu-tmp'
alias pscpu10='ps auxf | egrep ^USER && ps auxf | egrep -v ^USER | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu | less -m'

# scp-aliases - copy .bash_aliases or bashrc file to update from master
alias scp-alias="scp john@192.168.1.15:/home/john/.bash_aliases ~/"
alias scp-bashrc="scp john@192.168.1.15:/home/john/.bashrc ~/"

# ssh-agent with ssh-add
alias ssha="eval $(ssh-agent) && ssh-add"

# Update root .bashrc and .bash_aliases files
_uid="$(id -u)"
if [ $_uid = "0" ]; then
  alias update_bash='cp .bash{rc,_aliases} ~/ && cd ~/ && source .bashrc'
  ## shortcut  for iptables and pass it via sudo#
  alias ipt='/sbin/iptables'
  # display all rules #
  alias iptlist='/sbin/iptables -L -n -v --line-numbers'
  alias iptlistin='/sbin/iptables -L INPUT -n -v --line-numbers'
  alias iptlistout='/sbin/iptables -L OUTPUT -n -v --line-numbers'
  alias iptlistfw='/sbin/iptables -L FORWARD -n -v --line-numbers'
  alias firewall=iptlist
  # udug - update and upgrade apps
  alias udug='apt update && apt full-upgrade -y'
  alias upgrade='apt update && apt dist-upgrade -y'
  # ud - update, full-upgrade, install  apps database
  alias ud='apt update'
  alias ug='apt full-upgrade -y'
  alias install='apt install'
  alias restart='reboot'
  alias shutdownnow='shutdown now'
  alias set-tz='timedatectl set-timezone America/Los_Angeles'
  alias cktime='timedatectl'
else # We need sudo!
  alias root='sudo -s'
  ## shortcut  for iptables and pass it via sudo#
  alias ipt='sudo /sbin/iptables'
  # display all rules #
  alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
  alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
  alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
  alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
  alias firewall=iptlist
  # udug - update and upgrade apps
  alias udug='sudo apt update && sudo apt full-upgrade -y'
  alias upgrade='sudo apt update && sudo apt dist-upgrade -y'
  # ud - update, full-upgrade, install  apps database
  alias ud='sudo apt update'
  alias ug='sudo apt full-upgrade -y'
  alias install='sudo apt install'
  alias restart='sudo reboot'
  alias shutdownnow='sudo shutdown now'
  alias set-tz='sudo timedatectl set-timezone America/Los_Angeles'
  alias cktime='sudo timedatectl'
fi
 
# Functions
# function_name () {
#   [commands]
# }

# Make Directoty and go to it
mkcd ()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

# clone user
clone-user ()
{
SRC=$1
DEST=$2

SRC_GROUPS=$(id -Gn ${SRC} | sed "s/ /,/g" | sed -r 's/\<'${SRC}'\>\b,?//g')
SRC_SHELL=$(awk -F : -v name=${SRC} '(name == $1) { print $7 }' /etc/passwd)

sudo useradd --groups ${SRC_GROUPS} --shell ${SRC_SHELL} --create-home ${DEST}
sudo passwd ${DEST}
sudo cp -r /home/${SRC}/.ssh/ /home/${DEST}/
sudo cp /home/${SRC}/.bash{rc,_aliases} /home/${DEST}/
sudo chown -R ${DEST}:${DEST} /home/${DEST}/
sudo ls -al /home/${DEST}/
}

