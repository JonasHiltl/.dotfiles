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
    nixpkgs.antibody \
    nixpkgs.oh-my-zsh \
    nixpkgs.stow \
    nixpkgs.neovim \
    nixpkgs.vimPlugins.packer-nvim

stow git
stow zsh
stow nvim
stow p10k

# Install GO when not already installed
# if ! command -v go &> /dev/null
# then
#   sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
# fi

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as default stell
chsh -s $(which zsh) $(whoami)

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
