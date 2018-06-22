#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "creating symlinks"
shopt -s dotglob
linkables=$( ls -1 -d **/*.symlink )
for file in $linkables ; do
    target="$HOME/.$( basename $file ".symlink" )"
    echo "creating symlink for $file"
    ln -sf $(pwd)/$file $target
done
shopt -u dotglob
