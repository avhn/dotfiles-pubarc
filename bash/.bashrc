export EDITOR=$(which emacs)
export GIT_EDITOR=$(which vim)

## sudo editors
alias emacs='sudo emacs'
alias vim='sudo vim'

## virtualenv
alias create='virtualenv --python=python3' #$dirname
alias activate='source /venv/bin/activate'

## git
alias rebase='git rebase -i --root' #$branch_name
alias pull='git pull'
alias gstat='git status'
alias gcommit='git commit'
alias glog='git log --oneline'
alias gdiff='git diff'

## default args
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

