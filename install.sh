#!/bin/bash

#echo "Installing yay..."
# mkdir ~/Downloads
# git clone https://aur.archlinux.org/yay.git ~/Downloads
# cd ~/Downloads/yay
# makepkg -si

echo "Installing oh-my-zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Installing zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Installing zsh-suggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Installing Vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing dotfiles to home..."
ln -f $HOME/.config/home/.bash_profile ~/.bashprofile
ln -f $HOME/.config/home/.bashrc ~/.bashrc
ln -f $HOME/.config/home/.xinitrc ~/.xinitrc
ln -f $HOME/.config/home/.Xresources ~/.Xresources
ln -f $HOME/.config/home/.Xmodmap ~/.Xmodmap
ln -f $HOME/.config/home/.zshrc ~/.zshrc
ln -f $HOME/.config/home/agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
ln -f $HOME/.config/home/cobalt2.zsh-theme ~/.oh-my-zsh/themes/cobalt2.zsh-theme
ln -f $HOME/.config/home/tkhunlertkit.zsh-theme ~/.oh-my-zsh/themes/tkhunlertkit.zsh-theme
ln -f $HOME/.config/home/.gtkrc-2.0 ~/.gtkrc-2.0
ln -f $HOME/.config/home/.vimrc ~/.vimrc
ln -f $HOME/.config/home/.tmux.conf ~/.tmux.conf

