fpath=(~/.zsh/completion $fpath)

# 自動補完を有効
autoload -Uz compinit && compinit -z
autoload -Uz colors && colors
autoload history-search-end

# LANG
export LANG=ja_JP.UTF-8

# PROXY
mac_proxy="http://"`networksetup -getwebproxy Wi-Fi|grep Server|sed -e "s/Server: //g"`":"`networksetup -getwebproxy Wi-Fi|grep Port|sed -e "s/Port: //g"`
export HTTP_PROXY=$mac_proxy
export HTTPS_PROXY=$mac_proxy
export http_proxy=$mac_proxy
export https_proxy=$mac_proxy
export proxy=$HTTP_PROXY

# COLOR
export TERM="xterm-256color"
unset LSCOLORS
export LSCOLORS=GxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# SCHOOL
if [ $HOST = "sendai" ] || [ $HOST = "naha" ] || [ $HOST = "osaka" ] || [ $HOST = "kumamoto" ]; then
    # python en
    export PYENV_ROOT="/lab/takahashi/master/python_env/pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"

    # 計算機上
    PATH=$PATH:/tools/env/bin
    export PATH
    PYTHONPATH=/tools/env/lib:/tools/env/lib64:/tools/env/lib64/python2.7/site-packages/:$PYTHONPATH
    export PYTHONPATH
fi
