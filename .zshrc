# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
 COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# I'm considering extracting the aliases I actually use... and leaving the rest.
plugins=(git brew npm bundler postgres history-substring-search)

source $ZSH/oh-my-zsh.sh

#############################################
### User configuration

export PATH="/usr/local/share/npm/bin":$PATH
export PATH="/usr/texbin":$PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin":$PATH
export PATH="$HOME/.rbenv/bin":$PATH
export PATH="$HOME/.rbenv/shims":$PATH
#export PATH="$HOME/.pyenv/bin":$PATH
#export PATH="$HOME/.pyenv/shims":$PATH
export PATH="$HOME/.goenv/bin":$PATH
#export PATH="$HOME/.goenv/shims":$PATH
export PATH="/usr/local/heroku/bin":$PATH
export PATH="/usr/local/narwhal/bin":$PATH
export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim' # export EDITOR='mvim'
fi

# Preferred key bindings (vi instead of emacs)
bindkey -v
# Kill the lag
export KEYTIMEOUT=1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv and pyenv
eval "$(rbenv init -)"
#eval "$(pyenv init -)"
eval "$(goenv init -)"


######################################
### ALIASES

# be nice to windows users
alias dir='ls'
alias c='clear'
alias cls='clear'
# personal aliases
alias md='mkdir -p'
alias rd='rmdir'
alias l='ls -la'
alias la='ls -al'
alias ll='ls -l'
alias ls='ls -CFG'
alias lsa='ls -lah'
alias pls='sudo'
alias please='sudo'
alias touche='touch'

# dev aliases
alias b='bundle'
alias z='zeus'
alias zr='zeus rake'
alias zs='zeus server'
alias zc='zeus console'
alias zd='zeus dbconsole'
alias gblame='git blame'
alias gg='git add -A .; git commit -m'
alias rk='bundle exec rake'

# tmux aliases
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tm='tmux show-messages'

# db aliases
alias pgstart='brew services start postgres'
alias pgstop='brew services stop postgres'
alias pgrestart='brew services restart postgres'
alias msstart='brew services start mysql'
alias msstop='brew services stop mysql'
alias msrestart='brew services restart mysql'

# project aliases
ereadz_domain='mogulview.com'
ssh_client='ssh'
user_name='simon'
ip_partial='176.9.70'
alias production="$ssh_client $user_name@mds.$ereadz_domain"
alias staging="$ssh_client $user_name@staging.$ereadz_domain"
alias development="$ssh_client $user_name@development.$ereadz_domain"
alias upgrade="$ssh_client $user_name@$ip_partial.209"

alias productionip="$ssh_client $user_name@$ip_partial.210"
alias stagingip="$ssh_client $user_name@$ip_partial.210"
alias developmentip="$ssh_client $user_name@$ip_partial.209"

# command aggregation aliases
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# .*rc file changes
alias zrc="vim ~/.zshrc"
alias vrc="vim ~/.vimrc"
alias trc="vim ~/.tmux.conf"


######################################
### Custom Shell Features

# jump to gems directory of current ruby version
gemsdir(){
  RBV="$(rbenv version-name)"
  echo "~/.rbenv/versions/$RBV/lib/ruby/gems/$RBV/gems"
}
alias gems=$(gemsdir)

# create pull request into specified branch (develop if none specified)
function gpr {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  branch=""
  if [ $1 ]; then
    branch="$1...$(current_branch)"
  else
    branch=$(current_branch)
  fi

  open "https://github.com/$repo/compare/$branch?expand=1"
}

# list pull requests for repo
function gprl {
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  echo Opening list of pull requests for $repo
  open "https://github.com/$repo/pulls"
}

######################################
### ENVIRONMENT

# rails devise default user for railsapps composer
export ADMIN_NAME="Admin Guy"
export ADMIN_EMAIL="admin@example.com"
export ADMIN_PASSWORD="password123"

# env variables
export NODE_PATH=/usr/local/lib/node
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GOPATH="$HOME/.goenv/bin"
export NARWHAL_ENGINE=jsc
export CAPP_BUILD=$HOME/.cappbuild
export SSL_CERT_FILE=/usr/local/opt/curl-ca-bundle/share/ca-bundle.crt

############.zshrc jwf 17.10.2015

# User configuration

#export java_home
export JAVA_HOME="/usr/libexec/java_home"

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

$( echo $(which vv)-completions)
