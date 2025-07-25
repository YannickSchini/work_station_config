#!/bin/bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

PROMPT_COMMAND=''
export PROMPT_COMMAND="history -a;history -n;$PROMPT_COMMAND"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
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

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set (neo)vim as editor of choice
export EDITOR=nvim

# For nvim to find its config
export XDG_CONFIG_HOME=$HOME/.config

# Source credentials
if [ -f ~/.bash_creds.bash ]; then
    . ~/.bash_creds.bash
fi

# Enable starship prompt
eval "$(starship init bash)"

# Enable zoxide
eval "$(zoxide init bash)"

alias fd=fdfind

source /usr/share/doc/fzf/examples/key-bindings.bash

# Kubectl autocompletion
source <(kubectl completion bash)

change_background () {
    gsettings set org.gnome.desktop.background picture-uri-dark file:///$(ls ~/Pictures/wallpapers/*.jpg -1 | sort -R | head -1)
}

# Add Go and NeoVim to PATH
export PATH=$PATH:/usr/local/go/bin:/opt/nvim-linux64/bin:/$HOME/go/bin

# For direnv to work
eval "$(direnv hook bash)"

change_background

add_jira_subtask () {
    # List issues
    issue_id=$(jira issue list -a yannick.schini@backmarket.com -t task -s ~Done -s ~Dropped --plain --no-headers | fzf | cut -f 2)
    # Create subtask
    subtask_id=$(jira issue create --type Sub-task --parent "$issue_id" --summary "$1" --assignee yannick.schini@backmarket.com --no-input | grep --only-matching BBOX-.*)
    # Move sub-task to other status
    [ -z "$2" ]
    jira issue move "$subtask_id" "$2"
}

start_zellij() {
    lsusb | rg "ErgoDox"
    if [ $? -eq 0 ]; then
        zellij --config ~/.config/zellij/config.bepo.kdl
    else
        zellij --config ~/.config/zellij/config.azerty.kdl
    fi
}

update_kitty() {
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
}
