#!/bin/bash

clone_neobundle(){
  echo "=========================================="
  if [ ! -d ~/.vim/bundle ]; then
    echo "create bundle directory..."
    mkdir -p ~/.vim/bundle
  fi

  if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    echo "Start to glone NeoBundle..."
    git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
  else
    echo "NeoBudndle is already cloned."
  fi
  echo "=========================================="
  echo ""
}


do_install(){
  echo "=========================================="
  echo "create symlink..."
  CUR_DIR=`pwd`
  RC_DIR=$(cd `dirname $0` && pwd)
  if [ ! -L $HOME/.vimrc ]; then
    ln -s ${RC_DIR}/vimrc $HOME/.vimrc
  else
    rm $HOME/.vimrc
    ln -s ${RC_DIR}/vimrc $HOME/.vimrc
  fi

  if [ ! -L $HOME/.zshrc ]; then
    ln -s ${RC_DIR}/zshrc $HOME/.zshrc
  else
    rm $HOME/.zshrc
    ln -s ${RC_DIR}/zshrc $HOME/.zshrc
  fi

  if [ ! -L $HOME/.tmux.conf ]; then
    ln -s ${RC_DIR}/tmux.conf $HOME/.tmux.conf
  else
    rm $HOME/.tmux.conf
    ln -s ${RC_DIR}/tmux.conf $HOME/.tmux.conf
  fi

  echo "=========================================="
  echo ""

  clone_neobundle
}


# Depend on OS-TYPE
case $OSTYPE in
  darwin* | linux*)
    do_install
    ;;

  *)
    echo "$OSTYPE is not supported"
esac
