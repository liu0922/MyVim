#!/bin/bash
rm -rf ~/.vim
rm ~/.vimrc
sudo rm -rf /usr/share/fonts/truetype/powerline-fonts

mkdir powerline-fonts
git clone https://github.com/Lokaltog/powerline-fonts ./powerline-fonts
sudo mv powerline-fonts /usr/share/fonts/truetype/powerline-fonts
sudo fc-cache -v -f

mv .vim ~/.vim
mv .vimrc ~/.vimrc

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/moll/vim-bbye.git ~/.vim/bundle/bbye

sudo apt-get install  exuberant-ctags  cscope
