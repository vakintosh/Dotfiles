# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

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
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#zsh-history-enquirer
source `npm root -g`/zsh-history-enquirer/zsh-history-enquirer.plugin.zsh

#CHTF
if [[ -f /usr/local/share/chtf/chtf.sh ]]; then
	source /usr/local/share/chtf/chtf.sh
fi

#PLUGINS
source ~/.dotfiles//mac/custom/plugins/git/git.plugin.zsh
source ~/.dotfiles//mac/custom/plugins/terraform/terraform.plugin.zsh
source ~/.dotfiles//mac/custom/plugins/tmux/tmux.plugin.zsh
source ~/.dotfiles/mac/custom/plugins/zsh-notify/notify.plugin.zsh
source ~/.dotfiles/mac/custom/plugins/jovial/jovial.plugin.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"