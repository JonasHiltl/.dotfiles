#!/bin/bash

# Install Nix
if [[ $OSTYPE != 'darwin'* ]]; then
  curl -L https://nixos.org/nix/install | sh

  # Source Nix
  . ~/.nix-profile/etc/profile.d/nix.sh
fi

# install packages
nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.stow \
  nixpkgs.neovim \
  nixpkgs.tree \
  nixpkgs.tmux

stow git
stow zsh
stow nvim
stow p10k

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default stell
chsh -s $(which zsh) $(whoami)

# install node with nvm
nvm install --lts
