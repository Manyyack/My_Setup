#!/bin/bash

if [ $# -ne 1 ]; then
    echo $0: usage: sudo ./install.sh username
    exit 1
fi

echo "*************Going to install the Shreel's set up***************** "
echo "Installing Vundle "
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#TODO : Need to seperate depencies according to the distro.
echo "Installing all the dependencies "
sudo apt install fonts-powerline exuberant-ctags cscope build-essential cmake3 cmake python3-dev ack-grep conky-all

echo "Replacing the .vimrc files "
rm ~/.vimrc
ln -s ~/Linux-Set-up/rc_files/vimrc ~/.vimrc

# rm -rvf ~/.vim/undo
mkdir ~/.vim/undo
chown $1 ~/.vim/undo

echo "Installing all the plugins "
vim +PluginInstall +qal

echo "Putting in the .ackrc files "
rm ~/.ackrc
ln -s ~/Linux-Set-up/rc_files/ackrc ~/.ackrc

echo "Copying Ultisnips"
rm ~/.vim/my-snippets/c.snippets
mkdir ~/.vim/my-snippets
chown $1 ~/.vim/my-snippets
ln -s ~/Linux-Set-up/ultisnips/c.snippets ~/.vim/my-snippets/c.snippets

echo "Installing the C syntax file "
rm ~/.vim/after/syntax/c.vim
mkdir -p ~/.vim/after/syntax/
chown $1 ~/.vim/after
chown $1 ~/.vim/after/syntax
ln -s ~/Linux-Set-up/syntax/c.vim ~/.vim/after/syntax/c.vim

echo "Setting up the colorschemes "
rm ~/.vim/bundle/vim-colorschemes/colors/heroku-terminal.vim
ln -s ~/Linux-Set-up/colors/heroku-terminal.vim ~/.vim/bundle/vim-colorschemes/colors/heroku-terminal.vim
rm ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/badwolf.vim
ln -s ~/Linux-Set-up/colors/badwolf.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/badwolf.vim

echo "Resetting .viminfo to remove ownership of root"
chown $1 ~/.viminfo

echo "Putting in the .conkyrc files"
rm ~/.conkyrc
ln -s ~/Linux-Set-up/rc_files/conkyrc ~/.conkyrc

# newvar=/home/$1/Linux-Set-up/wallpaper/linux_sudo.png
# echo "Setting the wallpaper"
# echo $newvar
# sudo -u $1 gsettings set org.gnome.desktop.background picture-uri file://$newvar

#echo "Adding the git config"
#ln -s ~/Linux-Set-up/rc_files/gitconfig ~/.gitconfig

# echo "Installing YCM engine and updating it. "
# cd ~/.vim/bundle/YouCompleteMe
# ./install.py --clang-completer

echo "*************Shreel's set up is complete ***************** "
