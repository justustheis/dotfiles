#!/usr/bin/env bash
datetime=$(date '+%d-%m-%Y-%H-%M-%S');

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

question () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

backup() {
	info "backup old dotfiles"
	mkdir -p ~/backup_dotfiles/$datetime/
	mv ~/.aliases ~/backup_dotfiles/$datetime/.aliases 
	mv ~/.gitconfig ~/backup_dotfiles/$datetime/.gitconfig
	mv ~/.tmux.conf ~/backup_dotfiles/$datetime/.tmux.conf
	mv ~/.vimrc ~/backup_dotfiles/$datetime/.vimrc			
	mv  ~/.vim ~/backup_dotfiles/$datetime/.vim
	mv  ~/.zshconfig ~/backup_dotfiles/$datetime/.zshconfig
	success
}

createFolders() {
	info "creating folders"
	mkdir -p ~/.vim/bundle
	success
}

createLinks() {
	info "creating symlinks"
	ln -s ~/dotfiles/dots/zsh/.aliases ~/.aliases	
	ln -s ~/dotfiles/dots/vifm ~/.config/vifm	
	ln -s ~/dotfiles/dots/zsh/.zshconfig ~/.zshconfig	
	ln -s ~/dotfiles/dots/vim/.vimrc ~/.vimrc	
	ln -s ~/dotfiles/dots/vim/colors ~/.vim/colors	
	ln -s ~/dotfiles/dots/vim/snippets ~/.vim/snippets
	ln -s ~/dotfiles/dots/vim/UltiSnips ~/.vim/UltiSnips
	ln -s ~/dotfiles/dots/vim/plugins.vim ~/.vim/plugins.vim
    git clone https://github.com/arcticicestudio/nord-tmux.git ~/.tmux/themes/nord-tmux 
	ln -s ~/dotfiles/dots/tmux/.tmux.conf ~/.tmux.conf
	ln -s ~/dotfiles/dots/git/.gitconfig ~/.gitconfig
	success
}

setupVim() {
	info "setup vim"
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	success
}

setupZsh() {
	info "setup zsh"
	echo "source ~/.zshconfig" >> $HOME/.zshrc
	zsh
	success
}


info "Welcome to dotfile setup"
sleep 4
backup
createFolders
createLinks
setupVim
setupZsh

success "Done. Have fun!"
exit 0;
