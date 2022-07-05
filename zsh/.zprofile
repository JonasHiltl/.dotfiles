#!/bin/bash
## GO
export PATH=$PATH:/usr/local/go/bin
if command -v go &> /dev/null
then 
  export GOPATH=~/projects/go
  export PATH=$PATH:$(go env GOPATH)/bin
  export GOROOT=/usr/local/go
fi

alias ls='ls --color=always'

# Neovim
alias vim='nvim'
alias v='nvim'
export EDITOR='nvim'

# Tmux
alias ta='tmux attach || tmux new-session\; split-window -h'
alias tn='tmux new-session\; split-window -h'

# Dircolors (maocs)
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
export COLORTERM=truecolor
