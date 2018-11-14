# JimFiles
My personal config files.

# Installation
## Unix
### Install & Configure
```
# Required Software -----------------------------

# Before you begin, you'll need the following:
# - git
# - curl

# JimFiles --------------------------------------

# Clone Repo & Setup
if [ ! -d ~/.jimfiles ] ; then
    git clone https://github.com/psndanjam123/.jimfiles ~/.jimfiles;
fi;

cd ~/.jimfiles;

git pull;

git checkout master;

# Vim -------------------------------------------

# Sym Link vimrc
mkdir -p ~/.vim;

if [ -e ~/.vim/vimrc ]; then
    rm ~/.vim/vimrc;
fi;

ln -s ~/.jimfiles/vim/vimrc ~/.vim/vimrc;

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;

vim +PlugInstall +qall;

# i3 --------------------------------------------

# Sym Link config
mkdir -p ~/.i3;

if [ -e ~/.i3/config ]; then
    rm ~/.i3/config;
fi;

ln -s ~/.jimfiles/i3/config ~/.i3/config;
```
