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

# Then, source plugins and add commands to $PATH
zplug load --verbose


