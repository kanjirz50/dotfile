source ~/.zplug/init.zsh
export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"

# PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/lib"
export PATH="/usr/local/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export PATH="$HOME/.ndenv/bin:$PATH"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
