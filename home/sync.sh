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
rsync .bash_profile ~/.bashprofile
rsync .bashrc ~/.bashrc
rsync .xinitrc ~/.xinitrc
rsync .Xresources ~/.Xresources
rsync .zshrc ~/.zshrc
rsync cobalt2.zsh-theme ~/.oh-my-zsh/themes/cobalt2.zsh-theme
rsync agnoster.zsh-theme ~/.oh-my-zsh/themes/agnoster.zsh-theme
echo Done

