#!/bin/bash
####################### original #######################
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*) ;;
esac

# Alias definitions.
if [ -f ~/.config/bash/aliases ]; then
    . ~/.config/bash/aliases
fi

# Powerline configuration
if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/share/powerline/bindings/bash/powerline.sh
fi

if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

if ! pgrep -x "powerline-daemon" >/dev/null; then
    # If not running, start powerline-daemon
    powerline-daemon -q
fi

force_color_prompt=yes

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/karan/anaconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/karan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/karan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/karan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

###############################################################################
#                              History Settings                               #
###############################################################################

export HISTSIZE=10000
export HISTFILESIZE=500000
export HISTCONTROL=ignoredups:erasedups

# Save history as soon as command is typed
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Keep bash history of different tmux sessions seperate
if [[ $TERM == "tmux-256color" ]] || [[ $TERM == "screen-256color" ]]; then
    export HISTFILE=/home/$USER/.tmux-bash-history/$(tmux display-message -p '#S')
fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] &&
    . /usr/share/bash-completion/bash_completion

###############################################################################
#                           Setting Bash Prompt                               #
###############################################################################

###############################################################################
#		                    	       Edited config		            	              #
###############################################################################
# autocompletion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

### SET VI MODE ###
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

### SETTING OTHER ENVIRONMENT VARIABLES

### SHOPT
shopt -s autocd  # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize   # checks term size when bash regains control
shopt -s checkwinsize
shopt -s histappend
#shopt -s globstar

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### COUNTDOWN

cdown() {
    N=$1
    while [[ $((--N)) > 0 ]]; do
        echo "$N" | figlet -c | lolcat && sleep 1
    done
}

### ARCHIVE EXTRACTION
# usage: ex <file>
ex() {
    if [ -f "$1" ]; then
        case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz) tar xzf $1 ;;
        *.bz2) bunzip2 $1 ;;
        *.rar) unrar x $1 ;;
        *.gz) gunzip $1 ;;
        *.tar) tar xf $1 ;;
        *.tbz2) tar xjf $1 ;;
        *.tgz) tar xzf $1 ;;
        *.zip) unzip $1 ;;
        *.Z) uncompress $1 ;;
        *.7z) 7z x $1 ;;
        *.deb) ar x $1 ;;
        *.tar.xz) tar xf $1 ;;
        *.tar.zst) unzstd $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# navigation
up() {
    local d=""
    local limit="$1"

    # Default to limit of 1
    if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
        limit=1
    fi

    for ((i = 1; i <= limit; i++)); do
        d="../$d"
    done

    # perform cd. Show error if cd fails
    if ! cd "$d"; then
        echo "Couldn't go up $limit dirs."
    fi
}

### BASH INSULTER ###
if [ -f /etc/bash.command-not-found ]; then
    . /etc/bash.command-not-found
fi

### PATH
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/bin:$PATH"
export LD_LIBRARY_PATH=/home/karan/.mujoco/mujoco210/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/nvidia
export PATH="$LD_LIBRARY_PATH:$PATH"
export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/Documents/Notes/Sem_VII/N2T/lab_files/lab2/tools/:$PATH"
export TERM="xterm-256color"                                        # getting proper colors
export XMONAD_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/xmonad" # xmonad.hs is expected to stay here
export EDITOR="nvim"
export VISUAL="code"
export XDG_CACHE_HOME="$HOME/.cache"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH
export GRADLE_USER_HOME="$HOME/.config/Android/gradle"
export ANDROID_SDK_HOME="$HOME/.config/Android"

export GUROBI_HOME="$HOME/Documents/Notes/Sem_VII/Crypto/codes/gurobi/tools/linux64"
export PATH="$GUROBI_HOME/bin:$PATH"
export PATH="$HOME/ns-allinone-3.42/ns-3.42:$PATH"

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${GUROBI_HOME}/lib"
export LESSHISTFILE="$HOME/.config/history/lesshst"
export PYTHON_HISTORY="$HOME/.config/history/python_history"
export PYTHONSTARTUP="/etc/python3/pythonrc"
export CARGO_HOME="$HOME/.config/.cargo"
export DOTNET_CLI_HOME="$XDG_CACHE_HOME/dotnet"
export RUSTUP_HOME="$HOME/.config/rustup"
export GNUPGHOME="$HOME/.config/gnupg"
export GHCUP_HOME="$HOME/.config/ghcup"
export NPM_CONFIG_USERCONFIG=$HOME/.config/npm/npmrc
export W3M_DIR="$XDG_STATE_HOME/w3m"
export STACK_ROOT="$XDG_DATA_HOME/stack"
. "$CARGO_HOME/env"

# export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so
# export PYTHONPATH="/home/karan/Templates/ravens"
# export HISTFILE="home/karan/.config/bash/bash_history"
# export ANDROID_USER_HOME="$HOME/.config/Android/android"
# export GUROBI_HOME="$HOME/Documents/Notes/Sem_VII/crypto/codes/gurobi/tools/linux64"
# export GRB_LICENSE_FILE="/home/karan/Documents/Lecture_Notes/Sem_VII/crypto/codes/gurobi/tools/gurobi.lic"
