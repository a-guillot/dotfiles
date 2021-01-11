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

echo 'Installing backup folder...'
cd $original_dir
ln -sf backup.sh ~/backup.sh

echo 'Creating symlink for matplotlib/matplotlibrc.symlink...'
mkdir -p ~/.config/matplotlib
ln -sf $original_dir/config/matplotlib/matplotlibrc.symlink \
    ~/.config/matplotlib/matplotlibrc

echo 'Creating symlink for vimrc/init.vim...'
cd $original_dir/vim/
./install

echo 'Installing vim plugins for vim...'
vim +'PlugInstall --sync' +qa
vim +PlugUpdate +qa

echo 'Copying custom styles for vim...'
mkdir -p ~/.vim/syntax
cp vim/custom_color/svm ~/.vim/syntax/svm.vim
