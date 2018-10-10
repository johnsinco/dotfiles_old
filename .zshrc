
# use antibody plugin manager
source <(antibody init)
antibody bundle < ~/.dotfiles/zsh/zsh_plugins.txt

# get aliases from alias file
source $HOME/.aliases



# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }
