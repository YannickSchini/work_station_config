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

# Terragrunt
# Inspired by the oh-my-zsh project, there are more there, don't hesitate to go take a look!
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/terraform/terraform.plugin.zsh
alias tg='terragrunt'
alias tga='terragrunt apply'
alias tgf='terragrunt fmt -recursive'
alias tgi='terragrunt init'
alias tgp='terragrunt plan'
alias tgv='terragrunt validate'

# Git
# Taken from the oh-my-zsh project, there are more there, don't hesitate to go take a look!
# Source: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch | fzf --multi | cut -d "/" -f 3 | xargs git branch --delete'
alias gbd!='git branch | fzf --multi | cut -d "/" -f 3 | xargs git branch --delete --force'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gcb='git checkout -b'
alias gco='git branch --remotes | rg -v HEAD | cut -d "/" -f 2 | fzf | xargs git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gdca='git diff --cached'
alias gds='git diff --staged'
alias gf='git fetch --prune'
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

# setup autocompletion
if [ -f "/usr/share/bash-completion/completions/git" ]; then
    source /usr/share/bash-completion/completions/git
    __git_complete g __git_main
    __git_complete ga _git_add
    __git_complete gaa _git_add
    __git_complete gapa _git_add
    __git_complete gb git_branch
    __git_complete gba git_branch
    __git_complete gc _git_commit
    __git_complete gc! _git_commit
    __git_complete gcn! _git_commit
    __git_complete gcp _git_cherry_pick
    __git_complete gcpa _git_cherry_pick
    __git_complete gcpc _git_cherry_pick
    __git_complete gd _git_diff
    __git_complete gdca _git_diff
    __git_complete gds _git_diff
    __git_complete gp _git_push
    __git_complete gpsup _git_push
    __git_complete gpd _git_push
    __git_complete gpf _git_push
    __git_complete gpf! _git_push
    __git_complete grb _git_rebase
    __git_complete grba _git_rebase
    __git_complete grbc _git_rebase
    __git_complete grbi _git_rebase
    __git_complete gst _git_status
    __git_complete gup _git_pull
else
  echo "Error loading git completions"
fi
