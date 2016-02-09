# alias
alias sort="LC_ALL=C sort"
alias uniq="LC_ALL=C uniq"
alias ls="ls --color=auto"

# export
export LANG=ja_JP.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
export PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

eval "$(pyenv init -)"
eval "$(rbenv init -)"

if [ $HOST = "newdelhi.nagaokaut.ac.jp" ]; then
    export HTTP_PROXY=http://proxy.nagaokaut.ac.jp:8080
    export HTTPS_PROXY=https://proxy.nagaokaut.ac.jp:8080
    export http_proxy=http://proxy.nagaokaut.ac.jp:8080
    export https_proxy=http://proxy.nagaokaut.ac.jp:8080
    export proxy=$HTTP_PROXY
fi
export TERM="xterm-256color"

if [ $HOST = "niigata" ]; then
    export VAGRANT_HOME="/takahashi_local/vagrant/.vagrant.d"
fi

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

# 自動補完を有効
autoload -U compinit
compinit

# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1

# ^Dでログアウトしない。
# setopt ignoreeof

# cd先をディレクトリスタックに追加
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_param_keys       # カッコの対応などを自動的に補完

# command_history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
setopt hist_expand # 補完時にヒストリを自動的に展開
# command_history_shortcut
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt HIST_IGNORE_DUPS   # 前と重複する行は記録しない
setopt HIST_FIND_NO_DUPS  # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt HIST_REDUCE_BLANKS # 余分な空白は詰めて記録
# setopt extended_history # 日付

# Ctrl+sでfwd-i-search
stty -ixon

# emacsフォアグラウンドトグル切り替え
foreground-emacs() {
      fg %emacs
      }
zle -N foreground-emacs
bindkey '^Z' foreground-emacs

zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}


# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# 先方予測
# autoload predict-on
# predict-on

## 「/」も単語区切りとみなす。 C-wで/まで削除。ディレクトリ操作が楽？
WORDCHARS=${WORDCHARS:s,/,,}

# redirect_opt
setopt multios

# ls_color
unset LSCOLORS
export LSCOLORS=GxFxCxdxBxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# git
source ~/.zsh/git-prompt.sh

# PROMPT表示設定
setopt PROMPT_SUBST
# setopt TRANSIENT_RPROMPT # コマンド実行後右プロンプトが消える
autoload colors
#colors

# local HOSTCOLOR=$'%{\e[38;5;'"$(printf "%d\n" 0x$(hostname|md5sum|cut -c1-2))"'m%}'

local p_rhst=""
if [[ -n "${REMOTEHOST}${SSH_CONNECTION}" ]]; then
    local rhost= 'ssh'
    rhost=${rhost#localhost:}
    rhost=${rhost%%.*}
    p_rhst="%B%F{yellow}$rhost%f%b"
fi

local p_cdir="%B%K{cyan}[%~]%k%b"$'\n'
local p_info="%B%K{magenta}[%n@%m${WINDOW:+"[$WINDOW]"}]%k%b"
local p_mark="%B%(?,%F{green},%F{red})%(!,#,%%)%f%b"
PROMPT="$p_cdir$p_rhst$p_info $p_mark "

precmd(){
    PROMPT='%B%K{green}$(__git_ps1 "[%s]")%k%b'
    PROMPT+="$p_info $p_mark "
    RPROMPT="%B%K{magenta}[%35<..<%~]%k%b"
}

# Emacs like key bind
bindkey -e

# auto_cd
setopt auto_cd

# syntax-highlighting
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# auto ls after cd command
chpwd() {
    ls_abbrev
}
ls_abbrev() {
    # -a : Do not ignore entries starting with ..
    # -C : Force multi-column output.
    # -F : Append indicator (one of */=>@|) to entries.
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                # -G : Enable colorized output.
                opt_ls=('-aCFG')
            fi
            ;;
    esac

    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')

    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')

    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}
