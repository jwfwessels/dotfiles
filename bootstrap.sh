#!/bin/sh

echo "Setting up your Mac 🛠 🏗"

# update is potentially dangerous. not sure if it will install major osx versions
# sudo softwareupdate -i -a

echo "Install Apple command line tools..."
# untested
check="$(xcode-\select --install)"
echo "$check"
str="xcode-select: note: install requested for command line developer tools\n"
while [[ "$check" == "$str" ]]; do
    check="$(xcode-\select --install)"
    sleep 1
done

if [[ ! -d "$HOME/.dotfiles" ]]; then
    echo "clone repo"
    git clone --recursive https://github.com/jwfwessels/dotfiles.git $HOME/.dotfiles
else
    echo "~/.dotfiles already exists..."
fi

echo "move to repo"
cd ~/.dotfiles
# Check for Homebrew and install if we don't have it
if [[ $(command -v brew) == "" ]]; then
    echo "Seems we need some homebrew 🍻"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# install brewfile
brew bundle

# update git config
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/settings/Spectacle/Shortcuts.json $HOME/Library/Application\ Support/Spectacle/Shortcuts.json

code --install-extension Shan.code-settings-sync

# install ohmyzsh
if [[ $(command -v uninstall_oh_my_zsh) == "" ]]; then
    echo "Seems we dont have OH MY ZSH 😱"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    zsh
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
fi

echo "last step switch this repo to using ssh 😬"
cd $HOME/.dotfiles && git remote set-url origin git@github.com:jwfwessels/dotfiles.git
cd $HOME
echo "🚀 its about damn time!"
