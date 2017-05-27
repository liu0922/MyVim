#!/bin/bash
# Remove original vim setting
rm -rf ~/.vim
rm ~/.vimrc
sudo rm -rf /usr/share/fonts/truetype/powerline-fonts

# Update powerline fonts
mkdir powerline-fonts
git clone https://github.com/Lokaltog/powerline-fonts ./powerline-fonts
sudo mv powerline-fonts /usr/share/fonts/truetype/powerline-fonts
sudo fc-cache -v -f

# Update .vimrc
cp .vimrc ~/.vimrc

#sudo apt-get install  exuberant-ctags  cscope

# Install vim
sudo apt-get install vim

# Install vim plugins
vim
