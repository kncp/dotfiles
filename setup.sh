#!/bin/zsh

# setup prezto
echo "setup prezto ..."
unlink ~/.zshrc

if [ ! -d ${ZDOTDIR:-$HOME}/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# update rc

cat <<EOF >> ~/.zshrc
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

# copy .zpreztorc

\cp -f $HOME/dotfiles/.zpreztorc $HOME/.zpreztorc

echo "ok"

# initialize dotfiles

echo "setup dot files"

DOT_FILES=( .gitconfig .gitconfig.github .gitignore_global )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

echo "ok"

# ready to use nvim

echo "ready to use nvim"

pyenv install 3.7.3 -s
pyenv local 3.7.3
eval "$(pyenv init -)"
pip3 install --upgrade pip
pip3 install --user pynvim

echo "ok"

