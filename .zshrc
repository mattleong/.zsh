# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=nvim

export ZSH_CUSTOM=~/.zsh

export DT_PATH="/home/mrchu001/dev/developer"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(wd sudo fzf zsh-syntax-highlighting)

#disable update prompt
DISABLE_UPDATE_PROMPT=true
SAVEHIST=10000

# asdf
# source $HOME/.asdf/asdf.sh
# source $HOME/.asdf/completions/asdf.bash

# kitty
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# neovim
alias v='nvim'

# User configuration
# Development
# Git shit
gl() {
	if [ $1 ] ; then
		git log --oneline -"$1" ;
	 else
		git log --oneline -25
	 fi
}

# git
alias gs='git status -sbu'
alias ga='git add -A'
alias gd='git diff'
alias gds='git diff --stat'
alias gca='git commit --amend'
alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'

gc() {
	git commit -m "$1"
}

# mcd: Makes new directory and jumps into it
mcd () { mkdir -p "$1" && cd "$1"; }

alias cd..='cd ../'                         # Go back 1 directory
# level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias c='clear'                             # c:            Clear

export DEV_ENV_PATH=/home/mrchu001/dev/developer-ng
export DEV_DEFAULT_STACK=wordpress
source $DEV_ENV_PATH/dev.sh

source $HOME/dev/developer/bash_functions
export DENO_INSTALL="/home/mrchu001/.deno"
export PATH="/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:$HOME/.npm-global/bin:/snap/bin/:$HOME/.cargo/bin:/home/mrchu001/.local/bin:$DENO_INSTALL/bin:$HOME/local/nvim/bin"

source $ZSH/oh-my-zsh.sh

