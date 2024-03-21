#!/bin/bash

if [[ ! -d ~/.config ]]; then
    mkdir ~/.config
fi

# Symlink dotfiles
echo "Symlink dotfiles"
ln -sf ~/.dotfiles/mac/custom/Brewfile ~/Brewfile
ln -sf ~/.dotfiles/mac/config/.tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/mac/config/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/mac/config/jovial.zsh-theme ~/.config/jovial.zsh-theme #Install Jovial theme
ln -sf ~/.dotfiles/mac/config/.vimrc ~/.vimrc

# # Install Homebrew and packages
if [[! command -v brew >/dev/null 2>&1 ]]; then
    echo "Install Homebrew and packages"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # add homebrew to profile
    # Check if env variable is set
    [[ -z $HOMEBREW_PREFIX ]] && export HOMEBREW_PREFIX=$(brew --prefix)
    
    # Check if path already exist in z.profile
    if grep -wq "bin/brew shellenv)" $HOME/.zprofile ; then
        echo "Homebrew already in profile" 
    else
        (echo; echo 'eval "$('$HOMEBREW_PREFIX'/bin/brew shellenv)"') >> $HOME/.zprofile
    fi
else
    echo "Homebrew already installed."
fi

brew bundle --file=~/Brewfile 

#zsh compinit
compaudit | xargs chmod g-w

# zsh-notify
git clone https://github.com/marzocchi/zsh-notify.git ~/.dotfiles/mac/custom/plugins/zsh-notify

# zsh-history-enquirer
if [ ! -d `npm root -g`/zsh-history-enquirer ]; then
    curl -#sSL https://github.com/zthxxx/zsh-history-enquirer/raw/master/scripts/installer.zsh | zsh
fi
