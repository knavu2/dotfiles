#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
PLUGINS_PATH="~/.vim/plugins.vim"

function logInstalling {
    INSTALLING="Installing "
    DOTS="..."
    echo $INSTALLING$1$DOTS
}

function logInstallingDone {
    INSTALLING="Installing "
    DOTS="... done"
    tput cuu1;tput el
    echo $INSTALLING$1$DOTS
}

# Install vim-plug (A plugin manager)
logInstalling Vim-Plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

logInstallingDone Vim-Plug

# Copy plugin file to ~/.vim/
echo "Copying ${SCRIPTPATH}/plugins.vim to ~/.vim/plugins.vim"
cp "${SCRIPTPATH}/plugins.vim" ~/.vim/plugins.vim

# Copying .vimrc file to home
echo "Copying ${SCRIPTPATH}/.vimrc to ~/.vimrc"
cp "${SCRIPTPATH}/.vimrc" ~/.vimrc

# Install Vim plugins
logInstalling "vim plugins"
vim +PlugInstall +qall
logInstallingDone "vim plugins"
