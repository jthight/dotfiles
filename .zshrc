# Version Date 20220610
# Set up the prompt
alias s-v='echo ".zshrc Version 20220610"'
source ~/.profile

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# update plugins 
zstyle ':omz:update' mode auto
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting you-should-use sudo 
  copyfile web-search copypath copybuffer history you-should-use rust tmux
  history-substring-search command-not-found rsync ubuntu vi-mode frontend-search
)

source $ZSH/oh-my-zsh.sh

# keys for zsh history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Check for Bash Aliases in .bash_aliases
BALIASE=~/.bash_aliases
if [ -f "$BALIASE" ]; then
  source "$BALIASE"
fi
# Check for local .aliases file and load if present
LALIASE=~/.aliases
if [ -f "$LALIASE" ]; then
  source "$LALIASE"
fi

# Evaluate zoxide
 eval "$(zoxide init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Starship as prompt https://starship.rs/
eval "$(starship init zsh)"
