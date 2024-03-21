# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"


[[ -z $HOMEBREW_PREFIX ]] && export HOMEBREW_PREFIX=$(brew --prefix)
export HOMEBREW_NO_AUTO_UPDATE=true
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

setopt EXTENDED_HISTORY

#JOVIAL THEME
source ~/.config/jovial.zsh-theme

# # ZSH-COMPLETIONS
autoload -Uz compinit
compinit

rm -f ~/.zcompdump; compinit
chmod go-w '/usr/local/share'
chmod -R go-w '/usr/local/share/zsh'

#ALIASES
source ~/.dotfiles/mac/custom/aliases

#AUTOJUMP
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

#zsh-history-enquirer
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh

#CHTF
if [[ -f $$HOMEBREW_PREFIX/share/chtf/chtf.sh ]]; then
	source $$HOMEBREW_PREFIX/share/chtf/chtf.sh
fi

# TMUX
if ! grep -wq "opt/tpm/share/tpm/tpm" $HOME/.tmux.conf ; then
    cat <<EOF >> $HOME/.tmux.conf
run '$HOMEBREW_PREFIX/opt/tpm/share/tpm/tpm'
EOF
fi

#PLUGINS
source ~/.dotfiles//mac/custom/plugins/git/git.plugin.zsh
source ~/.dotfiles//mac/custom/plugins/terraform/terraform.plugin.zsh
source ~/.dotfiles//mac/custom/plugins/tmux/tmux.plugin.zsh
source ~/.dotfiles/mac/custom/plugins/zsh-notify/notify.plugin.zsh
source ~/.dotfiles/mac/custom/plugins/jovial/jovial.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"