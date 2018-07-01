#!//bin/sh
# Run this script to link home config to this directory for easy git sync

# echo Removing all files
# rm -rf .bash_profile .bashrc cobalt2.zsh-theme .xinitrc .Xresources .zshrc

# echo Generating hard link...
# ln ~/.bash_profile
# ln ~/.bashrc
# ln ~/.xinitrc
# ln ~/.Xresources
# ln ~/.zshrc
# ln ~/.oh-my-zsh/themes/cobalt2.zsh-theme
# echo Done

echo Syncing...
ln -f .bash_profile ~/.bashprofile
ln -f .bashrc ~/.bashrc
ln -f .xinitrc ~/.xinitrc
ln -f .Xresources ~/.Xresources
ln -f .Xmodmap ~/.Xmodmap
ln -f .zshrc ~/.zshrc
ln -f agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
ln -f cobalt2.zsh-theme ~/.oh-my-zsh/themes/cobalt2.zsh-theme
ln -f .gtkrc-2.0 ~/.gtkrc-2.0
echo Done

