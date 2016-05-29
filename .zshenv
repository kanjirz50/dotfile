fpath=(~/.zsh/completion $fpath)

# 自動補完を有効
autoload -Uz compinit && compinit -z
autoload -Uz colors && colors
autoload history-search-end

# LANG
export LANG=ja_JP.UTF-8

# PROXY
export HTTP_PROXY=http://proxy.nagaokaut.ac.jp:8080
export HTTPS_PROXY=https://proxy.nagaokaut.ac.jp:8080
export http_proxy=$HTTP_PROXY
export https_proxy=https://proxy.nagaokaut.ac.jp:8080
export proxy=$HTTP_PROXY

# COLOR
export TERM="xterm-256color"
unset LSCOLORS
export LSCOLORS=GxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'


