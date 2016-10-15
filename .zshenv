fpath=(~/.zsh/completion $fpath)

# 自動補完を有効
autoload -Uz compinit && compinit -z
autoload -Uz colors && colors
autoload history-search-end

# LANG
export LANG=ja_JP.UTF-8

# PROXY
# export HTTP_PROXY=http://proxy.nagaokaut.ac.jp:8080
# export HTTPS_PROXY=https://proxy.nagaokaut.ac.jp:8080
# export http_proxy=$HTTP_PROXY
# export https_proxy=https://proxy.nagaokaut.ac.jp:8080
# export proxy=$HTTP_PROXY

# COLOR
export TERM="xterm-256color"
unset LSCOLORS
export LSCOLORS=GxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

proxy=http://proxy.nagaokaut.ac.jp:8080
function set_proxy(){
    export HTTP_PROXY=$proxy
    export HTTPS_PROXY=$proxy
    export FTP_PROXY=$proxy
    export http_proxy=$proxy
    export https_proxy=$proxy
    export ftp_prxy=$proxy

    git config --global http.proxy $proxy
    git config --global https.proxy $proxy
    git config --global url."https://".insteadOf git://
}

function unset_proxy(){
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset http_proxy
    unset https_proxy
    unset ftp_prxy

    git config --global --unset http.proxy
    git config --global --unset https.proxy
    git config --global --unset url."https://".insteadOf
}

# SCHOOL
if [ `domainname` = "monolith" ] ; then
    # echo "nagaokaut settings..." 1>&2
    # python en
    export PYENV_ROOT="/lab/takahashi/master/python_env/pyenv"
    PATH="/usr/local/cuda/bin:/tools/env/bin:$PYENV_ROOT/bin:/lab/takahashi/tools/bin:/lab/takahashi/tools/drake/bin:$PATH"
    LD_LIBRARY_PATH=/tools/snowman/library/boost/python3/boost_1_61_0/stage/lib/:$LD_LIBRARY_PATH
    export PATH
    eval "$(pyenv init -)"

    # load self compiled emacs
    alias emacs=/tools/env/bin/emacs

    set_proxy
else
    # echo 'local settings' 1>&2
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    unset_proxy
fi

