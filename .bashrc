# extract
function extract () {
  for i in "$@" ; do
    if [ -f $i ] ; then
      case $i in
        *.tar.bz2)   tar xjf $i     ;;
        *.tar.gz)    tar xzf $i     ;;
        *.bz2)       bunzip2 $i     ;;
        *.rar)       unrar e $i     ;;
        *.gz)        gunzip $i      ;;
        *.tar)       tar xf $i      ;;
        *.tbz2)      tar xjf $i     ;;
        *.tgz)       tar xzf $i     ;;
        *.zip)       unzip $i       ;;
        *.Z)         uncompress $i  ;;
        *.7z)        7z x $i        ;;
        *)     echo "'$i' cannot be extracted via extract()" ;;
         esac
    else
         echo "'$i' is not a valid file"
    fi
  done
}
 
# sexy ls
alias ll='ls -aFhl --color=auto'
 
# recursivce directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'''
 
# biggest object in location
alias ds='du -ks * 2>/dev/null | sort -n'
 
# fast update
function fu {
	if [ "$LOGNAME" == "root" ] ; then
		if [ -f /usr/bin/yum ] ; then
			yum update && yum clean expire-cache packages headers plugins
		else
			apt-get update && apt-get upgrade && apt-get clean
		fi
	elif [ -f "/usr/bin/sudo" ] ; then
		if [ -f /usr/bin/yum ] ; then
			sudo yum update && sudo yum clean expire-cache packages headers plugins
		else
			sudo apt-get update && sudo apt-get upgrade && sudo apt-get clean
		fi
	else
		echo "Need Root"
	fi
}
 
# Reconnect or start a tmux or screen session over ssh
function sssh (){ ssh -t "$@" 'tmux attach || tmux new || screen -DR'; }
 
# Make and cd into directory
function mcd() {
  mkdir -p "$1" && cd "$1";
}
 
# tail with highlight search
function tf() { 
tail -f $2 $3 $4 $5 | perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"
}

# tail follow shortcut 
function t() {
tail -f $@
}

# get rid of command not found
alias cd..='cd ..'
 
# a quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'
alias .7='cd ../../../../../../../'
alias .8='cd ../../../../../../../../'
