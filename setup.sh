#!/bin/bash

# initialize dotfiles

DOT_FILES=( .zshrc .gitconfig .gitignore_global )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# use zsh

SHELLS=`cat /etc/shells`
if [[ ! $SHELLS =~ \/usr\/local\/bin\/zsh ]]; then
    sudo echo '/usr/local/bin/zsh' >> /etc/shells
fi
