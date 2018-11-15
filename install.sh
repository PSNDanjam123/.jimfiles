#!/bin/bash

# Variables -------------------------------------
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"    # .jimfiles path
VIMPATH=$HOME/.vim
I3PATH=$HOME/.i3

# Install Requirements --------------------------
if [ -x "$(command -v apt-get)" ]; then             # apt-get
    if ! [ -x "$(command -v git)" ]; then
        sudo apt-get install git -y;
    fi
    if ! [ -x "$(command -v curl)" ]; then
        sudo apt-get install curl -y;
    fi
    if ! [ -x "$(command -v vim)" ]; then
        sudo apt-get install vim -y;
    fi
    if ! [ -x "$(command -v i3)" ]; then
        sudo apt-get install i3 -y;
    fi
fi

# Verify Requirements ---------------------------
if ! [ -x "$(command -v git)" ]; then
    echo 'Error: git is not installed.';
    exit 1
elif ! [ -x "$(command -v curl)" ]; then
    echo 'Error: curl is not installed.';
    exit 1
fi

# Setup Vim -------------------------------------
if ! [ -x "$(command -v vim)" ]; then
    echo 'Warning: vim is not installed, skipping...';
else
    echo 'Setting up Vim...';
    mkdir -p $VIMPATH;

    if [ -e $VIMPATH/vimrc ]; then
        rm $VIMPATH/vimrc;
    fi;

    ln -s $SCRIPTPATH/vim/vimrc $VIMPATH/vimrc;

    if ! [ -e $VIMPATH/autoload/plug.vim ]; then
        curl -fLo $VIMPATH/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;
    fi

    vim +PlugInstall +qall;
fi

# Setup i3 --------------------------------------
if ! [ -x "$(command -v i3)" ]; then
    echo 'Warning: i3 is not installed, skipping...';
else
    echo 'Setting up i3...';
    mkdir -p $I3PATH;

    if [ -e $I3PATH/config ]; then
        rm $I3PATH/config;
    fi

    ln -s $SCRIPTPATH/i3/config $I3PATH/config;
fi

echo 'Setup complete.';
