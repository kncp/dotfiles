#!/bin/bash

# setup prezto

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# update rc

cat \<<EOF >> ~/.zshrc
# path
[ -f ~/dotfiles/.zshrc.path ] && source ~/dotfiles/.zshrc.path

# opt
[ -f ~/dotfiles/.zshrc.opt ] && source ~/dotfiles/.zshrc.opt

# alias
[ -f ~/dotfiles/.zshrc.alias ] && source ~/dotfiles/.zshrc.alias

# history
[ -f ~/dotfiles/.zshrc.history ] && source ~/dotfiles/.zshrc.history

# base
[ -f ~/dotfiles/.zshrc.base ] && source ~/dotfiles/.zshrc.base

# local
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
EOF

# override .zpreztorc

mv ~/dotfiles/.zpreztorc ~/.zpreztorc

# initialize dotfiles

DOT_FILES=( .gitconfig .gitignore_global )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# use zsh

SHELLS=`cat /etc/shells`
if [[ ! $SHELLS =~ \/usr\/local\/bin\/zsh ]]; then
    sudo echo '/usr/local/bin/zsh' >> /etc/shells
fi
