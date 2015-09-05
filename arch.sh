#enable pacman color
sudo sed -i 's/#Color/Color/' /etc/pacman.conf

yes | sudo pacman -Syu
yes | sudo pacman -S --needed git vim zsh
sudo ln -sf ./vim /usr/bin/vi

#clone dotfiles
if [[ ! -d ~/.dotfiles ]]; then
  git clone git://github.com/ZhengzhongZhang/dotfiles ~/.dotfiles
  ln -s .dotfiles/vimrc ~/.vimrc
  ln -s .dotfiles/gitconfig ~/.gitconfig
fi

#install Vundle and Plugins
if [[ ! -d ~/.vim/bundle/Vundle.vim/ ]]; then
  git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi

#install prezto
if [[ ! -d ~/.zprezto ]]; then
  git clone git://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
  cd ~/.zprezto
  git submodule update --init --recursive \
    modules/history-substring-search/external \
    modules/syntax-highlighting/external \
    modules/completion/external
  rm ~/.zprezto/modules/prompt/functions/{async,prompt_agnoster_setup,prompt_powerline_setup,prompt_pure_setup}

  zsh -c '
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done'

  chsh -s /bin/zsh
fi
