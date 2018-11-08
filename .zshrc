
# use antibody plugin manager
source <(antibody init)
antibody bundle < ~/.dotfiles/zsh/zsh_plugins.txt

# get aliases from alias file
source $HOME/.aliases

# set colors
export CLICOLOR=1

# set editors
set -o vi
export EDITOR=vim
export VISUAL=vim

# set options
setopt autocd

# history
SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY_TIME

# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

# zsh plugin config


# setup rbenv
eval "$(rbenv init -)"
