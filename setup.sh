#!/bin/bash

if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# Symlink dotfiles
echo "Symlink dotfiles"
ln -s ~/.dotfiles/mac/config/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/mac/config/.zshrc ~/.zshrc
ln -s ~/.dotfiles/mac/config/jovial.zsh-theme ~/.config/jovial.zsh-theme #Install Jovial theme

# ln -s ~/dotfiles/mac/.vimrc ~/.vimrc

# # Install Homebrew and packages
echo "Install Homebrew and packages"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle --file=~/.dotfiles/mac/custom/Brewfile 

#zsh compinit
compaudit | xargs chmod g-w

# zsh-notify
git clone https://github.com/marzocchi/zsh-notify.git ~/.dotfiles/mac/custom/plugins/zsh-notify

# TMUX
tmux source ~/.tmux.conf

source ~/.zshrc