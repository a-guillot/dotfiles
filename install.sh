#!/bin/bash

original_dir=$(pwd)

echo 'Installing dependencies'
source ./deps.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

if [ ! -d ~/.antigen ]; then
    echo 'Installing antigen...'
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
else
    cd ~/.antigen; git pull
fi

echo 'Installing vim-plug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Installing Oh My Zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'Installing dotfiles...'
cd $original_dir
source ./link.sh

echo 'creating symlink for matplotlib/matplotlibrc.symlink'
mkdir -p ~/.config/matplotlib
ln -sf $original_dir/config/matplotlib/matplotlibrc.symlink \
    ~/.config/matplotlib/matplotlibrc

echo 'creating symlink for vimrc/init.vim'
mkdir -p ~/.config/nvim
ln -sf $original_dir/config/nvim/init.vim.symlink \
    ~/.config/nvim/init.vim

echo 'Installing vim plugins for vim'
vim +'PlugInstall --sync' +qa
vim +PlugUpdate +qa
