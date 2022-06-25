# GO
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

# Dircolors (maocs)
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
