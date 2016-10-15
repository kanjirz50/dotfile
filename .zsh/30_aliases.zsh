# alias
alias sort="LC_ALL=C sort"
alias uniq="LC_ALL=C uniq"
alias grep="LC_ALL=C grep"
alias ls="ls --color=auto"
alias weather="curl wttr.in/Nagaoka"
alias ..='cd ..'

alias less="less -M"

function color_less() {
    pygmentize -O style=monokai -f console256 -g $1 | less -iNRM
}
alias cless=color_less

# emacs client
alias e='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
