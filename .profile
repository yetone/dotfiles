if [ -n "$TERM_PROGRAM" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi

    if [ -f "$HOME/.bash_aliases" ]; then
        . "$HOME/.bash_aliases"
    fi
fi

PATH=$(brew --prefix python)/bin:$PATH
PATH=$(brew --prefix ruby)/bin:$PATH
PATH=$(brew --prefix node)/bin:$PATH
export GHC_DOT_APP="/Applications/Glasgow Haskell.app"
if [ -d "$GHC_DOT_APP" ]; then PATH=$GHC_DOT_APP/Contents/bin:$PATH; fi
if [ -d "$HOME/.cabal/bin" ]; then PATH=$HOME/.cabal/bin:$PATH; fi
if [ -d "$HOME/.go" ]; then export GOPATH=$HOME/.go; fi
if [ -n "$GOPATH" ]; then PATH=$GOPATH/bin:$PATH; fi
if [ -d "$HOME/.bin" ]; then PATH=$HOME/.bin:$PATH; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

set -o vi
function gi() { curl http://www.gitignore.io/api/$@ ;}
