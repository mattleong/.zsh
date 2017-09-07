# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(j wd sudo zsh-autosuggestions)

#disable update prompt
DISABLE_UPDATE_PROMPT=true
SAVEHIST=1000

# User configuration
# Development
# Git shit
gl() {
	if [ $1 ] ; then
		git log --oneline "$1" ;
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

gc() {
	git commit -m "$1"
}

rk() {
osascript - "$@" <<EOF
on run argv

tell application "iTerm"

	tell current window
		create tab with default profile
	end tell

	tell current session of current window
		split vertically with same profile
		split vertically with same profile
	end tell

	tell session 1 of current tab of current window
		write text "wd rk"
		write text "code ."
	end tell

	tell session 2 of current tab of current window
		write text "wd rk"
		write text "gulp watch"
	end tell

	tell session 3 of current tab of current window
		write text "wd rk"
		write text "nodemon app.js"
	end tell

end tell

end run
EOF
}

dt() {
	DEV_PATH="$HOME/dev/dt_local"
	RETURN_PATH=$(pwd)

	if [ -z $1 ] ; then
		echo "☠  No arguments passed."
	fi

	if [[ $1 == up ]] ; then
		cd $DEV_PATH
		vagrant up
		cd $RETURN_PATH
	fi

	if [[ $1 == reload ]] ; then
		cd $DEV_PATH
		vagrant reload
		cd $RETURN_PATH
	fi

	if [[ $1 == halt ]] ; then
		cd $DEV_PATH
		vagrant halt
		cd $RETURN_PATH
	fi

	# do tests
	if [[ $1 == tests ]] ; then
		cd $DEV_PATH
		vagrant rake dt:phpunit
		cd $RETURN_PATH
	fi

	# build js
	if [[ $1 == js ]] ; then
		cd $DEV_PATH/src/websites/www.digitaltrends.com
		gulp dt:js
		cd $RETURN_PATH
	fi

	# build css
	if [[ $1 == css ]] ; then
		cd $DEV_PATH/src/websites/www.digitaltrends.com
		gulp dt:optimize:css
		cd $RETURN_PATH
	fi
}

alias gbs='wd bs && gulp && wd dt && dt js'

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

alias flushDNS='dscacheutil -flushcache'            # flushDNS:

extract () {
	if [ -f $1 ] ; then
	  case $1 in
		*.tar.bz2)   tar xjf $1     ;;
		*.tar.gz)    tar xzf $1     ;;
		*.bz2)       bunzip2 $1     ;;
		*.rar)       unrar e $1     ;;
		*.gz)        gunzip $1      ;;
		*.tar)       tar xf $1      ;;
		*.tbz2)      tar xjf $1     ;;
		*.tgz)       tar xzf $1     ;;
		*.zip)       unzip $1       ;;
		*.Z)         uncompress $1  ;;
		*.7z)        7z x $1        ;;
		*)     echo "'$1' cannot be extracted via extract()" ;;
		 esac
	 else
		 echo "'$1' is not a valid file"
	 fi
}

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin/:~/.npm-global/bin"

export NVM_DIR="~/.nvm"
alias loadrvm='[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"'
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"'

source $ZSH/oh-my-zsh.sh

