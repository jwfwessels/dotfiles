#!/bin/sh

echo "Setting up your Mac 🛠 🏗"

# update is potentially dangerous. not sure if it will install major osx versions
# sudo softwareupdate -i -a

echo "Install Apple command line tools..."
xcode-select --install


# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
    echo "Seems we need some homebrew 🍻"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# install brewfile
brew bundle

# install ohmyzsh
if test !$(which ZSH); then
    echo "Seems we dont have OH MY ZSH 😱"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
fi

do_install_font_assets() {
  print_subsection "Installing fonts ✏️"
  if $IS_MAC; then
    _font_dir="${HOME}/Library/Fonts"
    [[ -d "${_font_dir}" ]] || mkdir -p "${_font_dir}"
    cp -f -v -R "${PROJECT_REPOSITORY_DIR}"/assets/fonts/* "${_font_dir}/"
    print_last_command_status
#   elif $IS_BASED_ON_UBUNTU_1604 || $IS_ARCH; then
#     _font_dir="/usr/local/share/fonts"
#     cp -f -v -r "${PROJECT_REPOSITORY_DIR}"/assets/fonts/* "${_font_dir}/" && fc-cache -f -v
#     fc-list | grep "$(ls "${_font_dir}" | sort -n | head -1)" # confirm if fonts have been installed
#     print_last_command_status
  fi
  unset _font_dir
}

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

echo "🚀 its about damn time!"