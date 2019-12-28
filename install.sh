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
mkdir ~/.vim
cp "${SCRIPTPATH}/plugins.vim" ~/.vim/plugins.vim

# Copying .vimrc file to home
echo "Copying ${SCRIPTPATH}/.vimrc to ~/.vimrc"
cp "${SCRIPTPATH}/.vimrc" ~/.vimrc

# Copying .bashrc file to home
echo "Copying ${SCRIPTPATH}/.bashrc to ~/.bashrc"
cp "${SCRIPTPATH}/.bashrc" ~/.bashrc

# Copying .profile file to home
echo "Copying ${SCRIPTPATH}/.profile to ~/"
cp "${SCRIPTPATH}/.profile" ~/

# Copying vim.init to ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/
cp "${SCRIPTPATH}/init.vim" ~/.config/nvim/init.vim
cp "${SCRIPTPATH}/coc-settings.json" ~/.config/nvim/

cp "${SCRIPTPATH}/alacritty.yml" ~/

# tmux
echo "Copying ${SCRIPTPATH}/.tmux.conf to ~/"
cp "${SCRIPTPATH}/.tmux.conf" ~/



# Install Vim plugins
logInstalling "vim plugins"
vim +PlugInstall +qall
logInstallingDone "vim plugins"
