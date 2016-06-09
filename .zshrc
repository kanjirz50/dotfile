# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh
export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"

# PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
export PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$HOME/.ndenv/bin:$PATH"

######
# zplug
########
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf
zplug "junegunn/fzf", rename-to:fzf-completion, use:shell/completion.zsh
zplug "junegunn/fzf", as:command, rename-to:fzf-tmux, use:bin/fzf-tmux
zplug "so-fancy/diff-so-fancy", as:command, use:diff-so-fancy
zplug "zsh-users/zaw"
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/cd-gitroot"
# Can manage local plugins
zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

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
    echo "nagaokaut settings..."
    # python en
    export PYENV_ROOT="/lab/takahashi/master/python_env/pyenv"
    PATH="/tools/env/bin:$PYENV_ROOT/bin:$PATH"
    export PATH
    eval "$(pyenv init -)"

    # load self compiled emacs
    alias emacs=/lab/takahashi/env/bin/emacs

    set_proxy
else
    echo 'local settings'
    export PYENV_ROOT=$HOME/.pyenv
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    unset_proxy
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


