# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/ckgun/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf
    # zsh-autosuggestions
    # zsh-syntax-highlighting
    # tmux
)

# Export fzf path
export FZF_BASE=/opt/homebrew/opt/fzf

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH=/opt/homebrew/bin:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias brew='arch -arm64 /opt/homebrew/bin/brew'
alias mddate='echo `date +%Y-%m-%d\ %H:%M:%S\ %z` | pbcopy'
alias mv="mv -i"
alias df="df -h"
alias info="neofetch"
alias gl="git log --graph --full-history --all --color --date=short --pretty=tformat:\"%x1b[31m%h%x08%x1b[0m%x20%ad %x1b[32m%d%x1b[0m    %s%x20%x1b[33m(%an)%x1b[0m\""
alias rld='exec zsh'
function vimf(){
    local fname
	printf 'Current directory: %s' "$(pwd)"
	fname=$(fd --type f -H -d 1 | sed 's/.\///g' | fzf) || return
    vim "$fname"
	printf "\r%b" "\033[2K"
}
alias vimf=vimf
function cdf(){
    local dirname
	while true ; do
		if [ -z "$@" ]; then
			printf 'Current directory: %s' "$(pwd)"
			dirname=$(ls -al | sed -n "2,$ p" | grep '^d' \
			| grep -wv "[.][a-zA-Z].*" | awk '{print $9}' | fzf) || return
			if [ "$dirname" = "." ]; then
				return
			fi
			cd "$dirname"
		else
			cd "$@"
			printf 'Current directory: %s' "$(pwd)"
			dirname=$(ls -al | sed -n "2,$ p" | grep '^d' \
			| grep -wv "[.][a-zA-Z].*" | awk '{print $9}' | fzf) || return
			if [ "$dirname" = "." ]; then
				return
			fi
			set -- "."
			cd "$dirname"
		fi
		printf "\r%b" "\033[2K"
	done
}
alias cdf=cdf
# alias mdpandoc="pandoc --pdf-engine=xelatex --from markdown --template eisvogel --listings -V mainfont="NanumGothic" -t latex"

# blinking vertial cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

# prompt pure theme
fpath+=/Users/ckgun/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# vim style bindkey (if you want use emacs style: bindkey -e)
bindkey -v
# remove mode switching delay
export KEYTIMEOUT=5

# FIGlet with lolcat
figlet -w 80 -f slant -l sideseal. | lolcat

# for vim color scheme
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# fzf setting
# export FZF_DEFAULT_COMMAND='fd . $HOME'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# # pyenv setting - but something wrong!
# export PATH="$HOME/.pyenv/bin:$PATH"
# export PATH="/usr/local/bin:$PATH"
# 
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
# 
