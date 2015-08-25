# dotfiles
my dotfiles config

linux: ln -s dotfiles/vimrc ~/.vimrc
windows: mklink .vimrc dotfiles/vimrc
>use secpol.msc to config permission of mklink
