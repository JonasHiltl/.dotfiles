if grep -qi microsoft /proc/version; then
  echo "Install Nix for WSL"
  curl -L https://nixos.org/nix/install --no-daemon | sh
  . ~/.nix-profile/etc/profile.d/nix.sh
 else
  echo "Installing Nix for Native Linux"
  curl -L https://nixos.org/nix/install --daemon | sh
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

# add zsh to valid login shells
command -v zsh | login shells

# use zsh as default stell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
