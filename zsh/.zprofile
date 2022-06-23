eval "$(/opt/homebrew/bin/brew shellenv)"

export ANDROID_HOME=/Volumes/data/android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# NPM
export PATH=~/.npm-global/bin:$PATH

# Android
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# GO
export GOPATH=~/projects/go
export PATH=$PATH:$(go env GOPATH)/bin
export GOROOT=/usr/local/go

# Neovim
alias vim='nvim'
export EDITOR='nvim'
