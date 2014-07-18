# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/justin/.rvm/gems/ruby-2.1.2/bin:/home/justin/.rvm/gems/ruby-2.1.2@global/bin:/home/justin/.rvm/rubies/ruby-2.1.2/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-8-oracle/bin:/usr/lib/jvm/java-8-oracle/db/bin:/usr/lib/jvm/java-8-oracle/jre/bin:/home/justin/.rvm/bin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias cmysql='mysql -pklvtz -uroot'
alias c='clear'
alias h='cd ~'
alias v='vim'
alias w='cd /var/www'
alias tmux='TERM=xterm-256color tmux'
# alias for laravel
alias g:m="php artisan generate:model"
alias g:c="php artisan generate:controller"
alias g:v="php artisan generate:view"
alias g:s="php artisan generate:seed"
alias g:mig="php artisan generate:migration"
alias g:r="php artisan generate:resource"
alias artisan="php artisan"
alias n98="php n98-magerun/bin/n98-magerun"
alias behat="vendor/bin/behat"
alias rs="sudo service apache2 restart"
alias x="exit"
# alias for ruby
alias rb="ruby"
# alias for Adobe Products
alias photoshop='wine /home/justin/.wine/drive_c/Program Files (x86)/Photoshop/Photoshop.exe' 
alias illustrator='wine .wine/drive_c/Program\ Files\ \(x86\)/IllustratorPortable/IllustratorPortable.exe'

# list disc space function alias
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

#empy apt archive to free up disk space
freeSpace () {
	echo "Disc Space I can clean:"
	du -sh /var/cache/apt/archives
	read "reply?Would you like me to do some house-keeping? (y/n) -> "
	if [[ $reply =~ ^[Yy]$ ]] 
	then
		sudo apt-get clean
	fi	
}


# make dirs for magento extension
magentoExt () {
	mkdir Block/ controllers/ etc/ Helper/ Model/ sql/
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
