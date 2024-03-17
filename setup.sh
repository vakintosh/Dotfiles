#!/bin/bash

if [ ! -d ~/.dotfiles ]; then
    mkdir -p ~/.dotfiles/mac/
fi

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# Symlink dotfiles
echo "Symlink dotfiles"
ln -s ~/.dotfiles/mac/.tmux.conf ~/.tmux.conf
ln -s ~/config/.zshrc ~/.zshrc
ln -s ~/config/jovial.zsh-theme ~/.jovial.zsh-theme #Install Jovial theme

# ln -s ~/dotfiles/mac/.vimrc ~/.vimrc

# # Install Homebrew and packages
echo "Install Homebrew and packages"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file=~/.dotfiles/mac/custom/Brewfile 

git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/mac/custom/plugins/tmux/tpm 