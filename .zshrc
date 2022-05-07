# Version Date 20220507
# Set up the prompt
alias s-v='echo ".zshrc Version 20220507"'
source ~/.profile
source ~/.bash_aliases

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Starship as prompt https://starship.rs/
eval "$(starship init zsh)"
