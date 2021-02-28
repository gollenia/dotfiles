
autoload -U colors && colors

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Enable VIM Mode
bindkey -v
export KEYTIMEOUT=1

# Make VIM mode to show different cursors for different modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
     echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
     [[ ${KEYMAP} == viins ]] ||
     [[ ${KEYMAP} = '' ]] ||
     [[ $1 = 'beam' ]]; then
     echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
  zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
  echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

export CLICOLOR=1
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

source ~/.zsh/plugins/deer.sh
zle -N deer
bindkey '\ek' deer

mkd ()
{
	mkdir -p -- "$1" &&
	cd -P -- "$1"
}

# Sudo
	function add_sudo() {
		BUFFER="sudo "$BUFFER
		zle end-of-line
	}
	zle -N add_sudo
	bindkey "^s" add_sudo
	
# Home - Navigates to the current root workspace
	function git_root() {
		BUFFER="cd $(git rev-parse --show-toplevel || echo ".")"
		zle accept-line
	}
	zle -N git_root
	bindkey "^h" git_root

# git
	function git_prepare() {
		if [ -n "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -m \"$BUFFER\" && git push"
		fi

		if [ -z "$BUFFER" ];
			then
				BUFFER="git add -A && git commit -v && git push"
		fi
				
		zle accept-line
	}
	zle -N git_prepare
	bindkey "^g" git_prepare
  
# up
	function up_widget() {
		BUFFER="cd .."
		zle accept-line
	}
	zle -N up_widget
	bindkey "^k" up_widget


setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt NO_CASE_GLOB
setopt AUTO_CD

alias ls='ls -h --color'
alias nano='vim'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
PROMPT='%F{green}%n@%m%f:%F{blue}%/%f$ '

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 1>/dev/null
