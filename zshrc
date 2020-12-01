export TERM="xterm-256color"

#zmodload zsh/zprof # top of your .zshrc file

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/aymeric/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Local config of powerlevel9k theme
if [[ "$ZSH_THEME" == "powerlevel9k/powerlevel9k" ]]; then
    POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='white'
    POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red'

    DEFAULT_USER='aymeric'
    POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time virtualenv context dir)# rbenv)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs status)

    POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
    POWERLEVEL9K_DIR_HOME_BACKGROUND="018"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="018"
    POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="018"

    POWERLEVEL9K_OK_ICON='✔'
    POWERLEVEL9K_STATUS_OK_FOREGROUND='black'
    POWERLEVEL9K_STATUS_OK_BACKGROUND='green'
    POWERLEVEL9K_CARRIAGE_RETURN_ICON='✘'
    POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'
    POWERLEVEL9K_TIME_FOREGROUND='white'
    POWERLEVEL9K_TIME_BACKGROUND='black'
    POWERLEVEL9K_VIRTUALENV_FOREGROUND='black'
    POWERLEVEL9K_VIRTUALENV_BACKGROUND='yellow'
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git screen zsh-completions zsh-syntax-highlighting docker docker-compose)# vagrant knife kitchen)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

source $ZSH/oh-my-zsh.sh
source ~/.zsh.d/zshrc

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=vim

alias ll='ls -l'
alias lla='ls -la'
alias s='cd ..'

alias df='df -h'
alias du='du -h'
alias rm='rm -i'

eval $(thefuck --alias)
alias f=fuck

eval "$(direnv hook zsh)"

# Node Version Manager (with lazy loading)
export NVM_DIR="/Users/aymeric/.nvm"

function _load_nvm() {
  echo "🚨 NVM not loaded! Loading now..."
  unset -f nvm npm node ng npx
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvmrc=$(grep -E '^v?[0-9.]+' .nvmrc 2>/dev/null)
  [ ! -z "$nvmrc" ] && nvm use $nvmrc
  "$@"
}

function nvm() {
    _load_nvm nvm "$@"
}

function npm() {
    _load_nvm npm "$@"
}

function node() {
    _load_nvm node "$@"
}

function ng() {
    _load_nvm ng "$@"
}

function npx() {
    _load_nvm npx "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi

# JAVA init
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export PATH=$HOME/bin/apache-maven-3.6.3/bin:$PATH

#zprof # bottom of .zshrc
