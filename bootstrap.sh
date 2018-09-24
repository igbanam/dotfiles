#!/bin/sh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew toys
if [ -x which brew ]; then
  cat brew/faucets | xards brew tap
  cat brew/toolstoy | xargs brew install
fi

if [ ! -f "~/.bashrc" ]; then
  touch ~/.bashrc
fi

cat << BASH_GIT_PROMPT_CONFIG >> ~/.bashrc
  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi
BASH_GIT_PROMPT_CONFIG

source ~/.bashrc

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Projects Directory
if [ ! -d "~/projects" ]; then
  mkdir ~/.projects
fi

# Clone the "Configuration of the Gods"
echo Clone the "Configuration of the Gods"

# Copy the VIMRC into place
echo "Copy the VIMRC into place"
