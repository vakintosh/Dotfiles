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
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


brew bundle --file=~/.dotfiles/mac/custom/Brewfile 

#zsh compinit
compaudit | xargs chmod g-w

# zsh-notify
git clone https://github.com/marzocchi/zsh-notify.git ~/.dotfiles/mac/custom/plugins/zsh-notify

# zsh-history-enquirer
if [ ! -d `npm root -g`/zsh-history-enquirer ]; then
    curl -#sSL https://github.com/zthxxx/zsh-history-enquirer/raw/master/scripts/installer.zsh | zsh
fi

# TMUX
tmux source ~/.tmux.conf

source ~/.zshrc