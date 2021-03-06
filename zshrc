bindkey -e

# load module
autoload -U compinit; compinit
autoload -U colors; colors

# set opt
setopt auto_pushd
#setopt pushd_ignore_dups
setopt extended_glob
setopt extended_historY

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

if [ -d "/usr/local/bin" ];then
  export PATH=/usr/local/bin:$PATH
fi

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# LLVMENV
export LLVMENV_HOME=~/.llvmenv
export PATH=$LLVMENV_HOME/bin:$PATH
if which llvmenv > /dev/null; then eval "$(llvmenv init)"; fi

# tex
export PATH=/usr/texbin:$PATH

# Go
EXIST_GO=`which go`
if [ -n $EXIST_GO ]; then
  if [ ! -d "$HOME/.go" ]; then
    mkdir -p $HOME/.go
  fi
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/.go
  export PATH=$GOPATH/bin:$PATH
fi


# Depends on OS-TYPE
case $OSTYPE in
  darwin*)
    # vim
    MVIM=`which mvim`
    if [ -e $MVIM ]; then
      alias vim="mvim -v"
    fi

    alias vi="vim"
    alias ls='ls -G'
    alias l='ls'
    alias ll='ls -la'
    ;;

  linux*)
    alias ls='ls --color=auto'
    alias ll='ls -la'
    ;;
esac
