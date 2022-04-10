eval "$(/opt/homebrew/bin/brew shellenv)"

# Enabling Homebrew autocomplete
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
