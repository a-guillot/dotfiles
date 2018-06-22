#!/bin/bash

original_dir=$(pwd)

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

if [ ! -d ~/.antigen ]; then
    echo 'Installing antigen...'
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
else
    cd ~/.antigen; git pull
fi

echo 'Installing dotfiles...'
cd $original_dir
source ./link.sh

echo 'creating symlink for matplotlib/matplotlibrc.symlink'
mkdir -p ~/.config/matplotlib
ln -sf $original_dir/config/matplotlib/matplotlibrc.symlink ~/.config/matplotlib/matplotlibrc

