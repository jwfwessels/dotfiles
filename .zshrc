# show all hidden folders

SHOWALLFILES=`defaults read com.apple.finder AppleShowAllFiles`
if [[ $SHOWALLFILES != 1 ]]; 
then
	defaults write com.apple.finder AppleShowAllFiles -boolean true
	echo "Set show hidden files true, please restart Finder."
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# add homebrew's sbin to path	
 export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$USER/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# COMPLETION_WAITING_DOTS="true"

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
plugins=(
  zsh-nvm
  npm
  git
#   yarn-autocompletions
)

source $ZSH/oh-my-zsh.sh

# User configuration
# incase you break your PATH run this:
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$PATH"
# vscode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# start postgresql server
alias dbup="postgres -D /usr/local/var/postgres"
alias dbupx="postgres -D /usr/local/var/postgresql@9.6"
alias dbup2="pg_ctl -D /usr/local/var/postgresql@9.6 start"

# command to download all the video urls in a list.txt file
alias dl-course='youtube-dl -a list.txt -o "%(autonumber)s-%(title)s.%(ext)s"'
# build the list.txt file from the website:
# eggheads, on player page using js:
# x = document.querySelectorAll('.up-next-list-item')

#x = document.querySelectorAll("ul.scroller li a")
#y = [...x].map((node) => node.href)
#console.log(y.join('\n'))

alias activate="source ve/bin/activate"

# exports for React Native tools to build native android code
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools


alias avd="/Users/jwfwessels/Library/Android/sdk/tools/emulator -avd Nexus_5X_API_23 -netdelay none -netspeed full"

# alias ngrok="source ~/ngrok"

# setHost() {
#     #$1 name of hostfile to use
#     if [[ ~/host-backups/$1 ]]
#     then
#         sudo cp ~/host-backups/$1 /etc/hosts
#     else
#         echo "set to host file, $1 doesnt exist yet"
#         ls ~/host-backups
#     fi
# }

# #$1 is string to append to host file, $2 is name of new hostfile
# createHost() {
#     if [[ $1 && $2 ]]
#     then
#         cp ~/host-backups/hosts ~/host-backups/$2
#         echo $1 >> ~/host-backups/$2
#         sudo cp ~/host-backups/$2 /etc/hosts
#     else
#         echo "\$1 is string to append to host file, \$2 is name of new hostfile"
#     fi
# }

# alias mysethost=setHost
# alias mycreatehost=createHost


# alias to love
alias love="/Applications/love.app/Contents/MacOS/love"

# git config --global core.exludesfile ~/.gitignore
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

setBetterBT() {
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
    defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80
}

unsetBetterBT() {
    defaults delete com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)"
    defaults delete com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)"
    defaults delete com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)"
    defaults delete com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)"
    defaults delete com.apple.BluetoothAudioAgent "Negotiated Bitpool"
    defaults delete com.apple.BluetoothAudioAgent "Negotiated Bitpool Max"
    defaults delete com.apple.BluetoothAudioAgent "Negotiated Bitpool Min"
}

nukeBTsettings() {
    sudo rm /Library/Preferences/com.apple.Bluetooth.plist
}

