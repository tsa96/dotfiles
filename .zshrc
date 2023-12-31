# This setup https://www.atlassian.com/git/tutorials/dotfiles
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

export PATH=$HOME/bin:/usr/local/bin:$PATH:
export ZSH=$HOME/.oh-my-zsh

plugins=(git
	tmux
)
source $ZSH/oh-my-zsh.sh

# Horrid hack to be able to use WT with -here
if [ "$(pwd)" = '/c/Windows/System32' ]; then
	cd
fi

# https://unix.stackexchange.com/questions/58870/ctrl-left-right-arrow-keys-issue
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
source ~/.zsh_aliases.zsh
if [ -f ~/.zsh_aliases_private.zsh ]; then
	source ~/.zsh_aliases_private.zsh
fi

# Load a custom non-VCS file if exists
if [ -f ~/.zshrc_custom ]; then
	source ~/.zshrc_custom
fi

# Theme - p10k submoduled
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
