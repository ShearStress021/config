#!/bin/bash
sudo apt remove vim-tiny vim


myDep=("flatpak" "gnome-software-plugin-flatpak" "gnome-tweaks" "git" "curl" "build-essential" "cmake" "python3-dev" "vim-nox")


sudo apt update && sudo apt upgrade
for item in ${myDep[@]}; do
	var=$(dpkg -l $item| grep 'ii' | awk "{print $2}")

	if [[ $item != $var  ]]; then
		
		sudo apt update && sudo apt install $item
	else 
		:
	fi

done

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo


git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd ~/.vim/bundle/YouCompleteMe

python3 install.py --clangd-completer

