# Utils

alias v=nvim
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias grep=rg

# Kubectl
# TODO

# Docker
# TODO

# Terraform
# TODO

# Git
# Taken from the oh-my-zsh project, there are more there, don't hesitate to go take a look!
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gcb='git checkout -b'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gf='git fetch'
alias gf='git fetch'
alias gpsup='git push --set-upstream origin $(git status | head -1 | cut -d " " -f 3)'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias gst='git status'
alias gup='git pull --rebase'
