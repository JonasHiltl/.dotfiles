if [[ $OSTYPE == 'darwin'* ]]; then
  echo 'Install Nix for Macos'
  curl -L https://nixos.org/nix/install | sh
else
  if grep -qi microsoft /proc/version; then
    echo "Install Nix for WSL"
    curl -L https://nixos.org/nix/install --no-daemon | sh
  else
    echo "Installing Nix for Native Linux"
    curl -L https://nixos.org/nix/install --daemon | sh
  fi
fi

# source nix
. /nix/var/nix/profiles/default/etc/profile.d/nix.sh

# install packages
nix-env -iA \
    nixpkgs.zsh \
    nixpkgs.oh-my-zsh \
    nixpkgs.stow \
    nixpkgs.neovim \
    nixpkgs.vimPlugins.packer-nvim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

stow git
stow zsh
stow nvim
stow p10k

# add zsh to valid login shells
command -v zsh | login shells

# use zsh as default stell
sudo chsh -s $(which zsh) $USER

