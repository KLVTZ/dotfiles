#!/bin/zsh

# Base 16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-atelier-cave-light.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

MT="~/Code/www/MotorTrend"
HG="~/Code/www/MotorTrendOnDemand"
DS="~/Code/www/Discovery"

# Aliases
alias c='clear'
alias h='cd ~'
alias v='vim'
alias rb='ruby'
alias w='cd ~/Code/www'
alias x='exit'
alias host='sudo vim /etc/hosts'
alias pgit='cd ~/Code/git'

alias mt="cd $MT"
alias hg="cd $HG"
alias dis="cd $DS"
alias notes="cd $MT/notes"
alias bell="cd $DS/vdp-bellevue"
alias reco="cd $DS/reco-platform"

alias python=/usr/local/bin/python3

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

updateVimPlugins() {
	echo "Updating Vim Plugins:"
	p=$(pwd)
	cd ~/.vim/pack/plugins/start
	for i in `ls`; do
		cd "$i"
		git pull
		cd ..
	done
	cd "$p"
}

macfeh() {
	open -b "drabweb.macfeh" "$@"
}

gocover() {
	go test -coverprofile=/tmp/cover.out ./...
	go tool cover -o /tmp/cover.html -html=/tmp/cover.out
	sed -i'.bak' -e 's/black/whitesmoke/g' /tmp/cover.html
	open /tmp/cover.html
}

synth() {
	fluidsynth -g 2 -p fluidsynth -o midi.driver=coremidi -o audio.driver=coreaudio \
		-o audio.coreaudio.device=default -o audio.period-size=256 \
		~/Music/soundfonts/generaluser/GeneralUser\ GS\ v1.471.sf2
}

# $PATH
export GOPATH=$HOME/Code/go
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:$(go env GOPATH)/bin

export NODE_ENV=develop
export COMPOSE_IGNORE_ORPHANS=1

export AWS_PROFILE=vdp-engineer
export AWS_REGION=us-west-2
