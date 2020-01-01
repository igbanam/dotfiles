# Make sure we are on a Mac with Ruby, cURL and Git for this
if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

brew bundle

echo "Finish up installation for bash-git-prompt"
if [ ! -f "~/.bash_profile" ]; then
  touch ~/.bash_profile
fi

cat << BASH_GIT_PROMPT_CONFIG >> ~/.bash_profile
  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi
BASH_GIT_PROMPT_CONFIG

. ~/.bash_profile
