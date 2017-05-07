#
# bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#
# Colors
#
red=$(tput setaf 1)
grn=$(tput setaf 2)
blu=$(tput setaf 4)
mag=$(tput setaf 5)
cya=$(tput setaf 6)
txtrst=$(tput sgr0)

#
# Functions
#

function fnr() {
find . -path ./.git -prune -type f -exec sed -i 's/$1/$2/g' {} \;
}

function carbon(){

if [ "$2" == "m" ]; then
  merge="heads"
else
  if ! [ -z "$2" ]; then
    topic="%topic=$2"
  fi;
  merge="for"
fi

git push ssh://frap129@review.carbonrom.org:29418/CarbonROM/android_$1 HEAD:refs/$merge/cr-5.1$topic;

}

function mkcd(){
mkdir -p $1 && cd $1
}

#
# Configuration
#
shopt -s checkwinsize
shopt -s histappend

#
# Aliases and environment variables
#
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fix='nano `git diff --name-only | uniq`'
alias la='ls -A'
export color_prompt=yes
export HISTCONTROL=ignoredups:ignorespace
export PS1="[\[$red\]Maple\[$txtrst\]\[$cya\]Server\[$txtrst\] \W]: \\$\[$(tput sgr0)\] "
export PATH=~/bin:~/bin/depot_tools:$PATH
export ANDROID_JACK_VM_ARGS="-Xmx6g"
export USE_CCACHE=1
export CCACHE_DIR=~/.ccache
export CCACHE_COMPRESS=1
export OUT_DIR_COMMON_BASE=/out
export CARBON_BUILDTYPE=Maple
