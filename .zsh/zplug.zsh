zplug "zplug/zplug"

# Can manage local plugins
zplug "~/.zsh", \
      from:local

zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"
zplug "junegunn/fzf", \
    use:shell/completion.zsh
zplug "junegunn/fzf", \
    as:command, \
    use:bin/fzf-tmux

zplug "peco/peco", \
    as:command, \
    from:gh-r, \
    frozen:1

zplug "so-fancy/diff-so-fancy", \
    as:command, \
    use:diff-so-fancy

zplug "zsh-users/zaw"

zplug "b4b4r07/enhancd", use:init.sh

zplug "mollifier/cd-gitroot"