#!/bin/zsh

# Base 16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-google-light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

TEN="~/Projects/www/TEN/htdocs/vvv/www/ten/wordpress/wp-content"
GRD="~/Projects/www/OffGrid/htdocs/hgv/hgv_data/sites/hhvm/wp-content"
OD="~/Projects/www/MotorTrend/OnDemand/htdocs/mercury/hgv_data/sites/hhvm"
HG="~/Projects/www/MotorTrend/OnDemand/api/"

# aliases
alias c='clear'
alias h='cd ~'
alias v='vim'
alias rb='ruby'
alias w='cd ~/Projects/www'
alias x='exit'
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vstat='vagrant global-status'
alias vhalt='vagrant halt'
alias host='sudo vim /etc/hosts'
alias pgit='cd ~/Projects/git'

alias ten="cd $TEN"
alias ondemand="cd $OD"
alias offgrid="cd $GRD"
alias lowrider="cd $TEN/themes/low-rider"
alias motortrend="cd $TEN/themes/motor-trend"
alias fourwheeler="cd $TEN/themes/four-wheeler"
alias halogen="cd $HG/halogen"
alias hg="cd $HG"
alias homestead='cd ~/Projects/git/Homestead'

# Functions
ds () {
	echo "Disk Space Utilization for $HOSTNAME"
	df -h
}
# extract current compressed filed -> provide argument
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)  tar xjf $1      ;;
			*.tar.gz)   tar xzf $1      ;;
			*.bz2)      bunzip2 $1      ;;
			*.rar)      rar x $1        ;;
			*.gz)       gunzip $1       ;;
			*.tar)      tar xf $1       ;;
			*.tbz2)     tar xjf $1      ;;
			*.tgz)      tar xzf $1      ;;
			*.zip)      unzip $1        ;;
			*.Z)        uncompress $1   ;;
			*)          echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

updateBundle() {
	echo "Updating Pathogen Plugins:"
	cd ~/.vim/bundle/
	for i in `ls`; do
		cd "$i"
		git pull
		cd ..
	done
}

# $PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export GOPATH=$PATH:/usr/local/opt/go/libexec/bin

# Languages
eval "$(pyenv init -)"
eval "$(rbenv init -)"
