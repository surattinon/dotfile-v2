# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################
## ZINIT SETUP ##
#################

# Set directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Auto clone zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit file
source "${ZINIT_HOME}/zinit.zsh"

#########################
## POWERLEVEL10K SETUP ##
#########################

# Add in Powelevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################################
############### PLUGINS ###############
#######################################

# features
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Replay cache completion
zinit cdreplay -q

# Terminal history setup
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erease
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matchar-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide__z:*' fzf-preview 'eza --icons=always --color=always'

# NVM Init
# source /usr/share/nvm/init-nvm.sh

# YAZI Setup
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#########
## KEY ##
#########
bindkey '^ ' autosuggest-accept

#########
## ENV ##
#########

export EDITOR=nvim
export SUDO_EDITOR=nvim
export SELECTED_EDITOR=nvim
export GCM_CREDENTIAL_STORE=secretservice

#######################$
## SHELL INTEGRATIONS ##
#######################$

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

###########
## ALIAS ##
###########

alias ls='eza --width 100 --icons=always --sort=extension'
alias la='eza -la -g --icons'

alias vim='nvim'

alias chadvim='NVIM_APPNAME=chadvim nvim'

alias cat='bat'

alias lzd="lazydocker"
alias lzg="lazygit"

alias spt="spotify_player"
