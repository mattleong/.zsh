# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export EDITOR=vim

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(wd sudo docker)

#disable update prompt
DISABLE_UPDATE_PROMPT=true
SAVEHIST=10000

# User configuration
# Development
# Git shit
gl() {
	if [ $1 ] ; then
		git log --oneline -"$1" ;
	 else
		git log --oneline -20
	 fi
}
alias gs='git status -sbu'
alias ga='git add -A'
alias gm='git merge'
alias gd='git diff'
alias gds='git diff --stat'
alias gca='git commit --amend'
alias gbn='git branch -b'
alias glg='git log --graph --abbrev-commit --decorate --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)" --all'

gc() {
	git commit -m "$1"
}

dt() {
	DEV_PATH="$HOME/dev/dtenv"
	RETURN_PATH=$(pwd)

	if [ -z $1 ] ; then
		echo "☠  No arguments passed."
	fi

	if [[ $1 == refresh ]] ; then
		cd $DEV_PATH
    rake env:refresh
		cd $RETURN_PATH
	fi

	if [[ $1 == stop ]] ; then
		cd $DEV_PATH
		docker-compose stop
		cd $RETURN_PATH
  fi

	# build
	if [[ $1 == js ]] ; then
		cd $DEV_PATH
    rake wp:gulp -- js
		cd $RETURN_PATH
	fi
  
	if [[ $1 == version ]] ; then
		cd $DEV_PATH
    rake wp:gulp -- version
		cd $RETURN_PATH
	fi

	if [[ $1 == css ]] ; then
		cd $DEV_PATH
    rake wp:gulp -- css
		cd $RETURN_PATH
	fi

	# build
	if [[ $1 == all ]] ; then
		cd $DEV_PATH
    rake wp:gulp
		cd $RETURN_PATH
	fi

	if [[ $1 == phpunit ]] ; then
		cd $DEV_PATH
    rake wp:phpunit
		cd $RETURN_PATH
	fi
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

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte.sh
fi

source $HOME/dev/dtenv/bash_functions

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/bin:/usr/sbin:/sbin:~/.npm-global/bin:~/apps"

export NVM_DIR="~/.nvm"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

source $ZSH/oh-my-zsh.sh

