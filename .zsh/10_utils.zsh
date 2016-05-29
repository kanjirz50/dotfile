source ~/.zsh/git-prompt.sh

export PYENV_ROOT=$HOME/.pyenv
# export PYENV_JEDI=$PYENV_ROOT/shims/jediepcserver
export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(rbenv init -)"
# eval "$(ndenv init -)"

# command_history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}

# 変数の添字を補完する
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

## 「/」も単語区切りとみなす。 C-wで/まで削除。ディレクトリ操作が楽？
WORDCHARS=${WORDCHARS:s,/,,}

# EDITOR
EDITOR='emacs'
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

# pip zsh completion start
function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
			 COMP_CWORD=$(( cword-1 )) \
		         PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
