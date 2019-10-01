# Make sure we are on a Mac with Ruby, cURL and Git for this
if ! is-macos -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: curl and/or git)"
  return
fi

curl -sSL https://get.rvm.io | bash -s stable
. $HOME/.rvm/scripts/rvm
