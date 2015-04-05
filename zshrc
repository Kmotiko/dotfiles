bindkey -e

# load module
autoload -U compinit; compinit
autoload -U colors; colors

# set opt
setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob

if [ -d "/usr/local/bin" ];then
  export PATH=/usr/local/bin:$PATH
fi

# LLVMENV
export LLVMENV_HOME=~/.llvmenv
source $LLVMENV_HOME/etc/llvmenvrc

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# tex
export PATH=/usr/texbin:$PATH

# Go
EXIST_GO=`which go`
if [ -n $EXIST_GO ]; then
  if [ ! -d "$HOME/.go" ];
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
