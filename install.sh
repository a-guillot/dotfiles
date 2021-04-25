#!/bin/bash

original_dir=$(pwd)

echo 'Installing dependencies'
source ./deps.sh

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors ~/.ssh

if [ ! -d ~/.antigen ]; then
    echo 'Installing antigen...'
    git clone https://github.com/zsh-users/antigen.git ~/.antigen
else
    cd ~/.antigen; git pull
fi

echo 'Installing true nvim...'
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim
chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin/
mkdir -p .config/nvim

echo 'Installing vim-plug...'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'Installing dotfiles...'
cd $original_dir
source ./link.sh

echo 'Creating symlink for matplotlib/matplotlibrc.symlink...'
mkdir -p ~/.config/matplotlib
ln -sf $original_dir/config/matplotlib/matplotlibrc.symlink \
    ~/.config/matplotlib/matplotlibrc

echo 'Creating symlink for vimrc/init.vim...'
cd $original_dir/vim/
./install

echo 'Installing vim plugins for nvim...'
nvim +'PlugInstall --sync' +qa
nvim +PlugUpdate +qa

echo 'Installing Oh My Zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
