
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
# export VIMRUNTIME=/usr/share/vim/vim80

# set options
setopt autocd

# history
SAVEHIST=5000
HISTSIZE=5000
HISTFILE=~/.zsh_history
setopt INC_APPEND_HISTORY_TIME EXTENDED_HISTORY HIST_IGNORE_ALL_DUPS
export ERL_AFLAGS="-kernel shell_history enabled"

# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }

# zsh plugin config
# history search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# setup rbenv
eval "$(rbenv init -)"

# setup apache spark python
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.4.3/libexec/
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook'

# FZF ignore files in gitignore
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="$PATH:/usr/local/opt/icu4c/bin"
export PATH="$PATH:/usr/local/opt/icu4c/sbin"
export PATH="$PATH:/usr/local/opt/openssl/bin"
# KIEX for multiple elixir versions
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# use HOMEBREW coreutils versions of utilities
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# stop homebrew from breaking ruby
export HOMEBREW_NO_INSTALL_CLEANUP=1

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh"  ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion"  ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

