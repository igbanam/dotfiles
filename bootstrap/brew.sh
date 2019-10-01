# Make sure we are on a Mac with Ruby, cURL and Git for this
if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

packages=(
  amberframework/amber/amber
  aws-elasticbeanstalk
  awscli
  bash-completion
  bash-git-prompt
  bat
  cmake
  composer
  elixir
  fzf
  git
  git-quick-stats
  gnupg@1.4
  graphviz
  heroku/brew/heroku
  hub
  jenkins-x/jx/jx
  joshuaclayton/formulae/unused
  jq
  kubernetes-cli
  node
  openssl@1.1
  php@7.1
  postgresql
  rabbitmq
  redis
  scons
  sqlite
  timescale/tap/timescaledb
  tree
  unrar
  vim
  yarn
)

brew install "${apps[@]}"

echo "Finish up installation for bash-git-prompt"
if [ ! -f "~/.bashrc" ]; then
  touch ~/.bashrc
fi

cat << BASH_GIT_PROMPT_CONFIG >> ~/.bashrc
  if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
  fi
BASH_GIT_PROMPT_CONFIG

. ~/.bashrc
