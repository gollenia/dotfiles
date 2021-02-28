#!/bin/bash
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#cp .tmux.conf ~/
#cp .vimrc ~/
#cp .profile ~/
#vim +PlugInstall +qall





prompt_install() {
	echo -ne "\xE2\x9C\x98 $1 is not installed. Would you like to install it? (y/n) " >&2
	old_stty_cfg=$(stty -g)
	stty raw -echo
	answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
	stty $old_stty_cfg && echo
	if echo "$answer" | grep -iq "^y" ;then
		if [ -x "$(command -v apt-get)" ]; then
			sudo apt-get install $1 -y
		fi 
	fi
}

check_for_software() {
	if ! [ -x "$(command -v $1)" ]; then
		prompt_install $1
	else
		printf "\xE2\x9C\x94 $1 is installed."
	fi
}

check_default_shell() {
	if [ -z "${SHELL##*zsh*}" ] ;then
			printf "\xE2\x9C\x94 Default shell is zsh."
	else
		printf "\xE2\x9C\x98 Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)"
		old_stty_cfg=$(stty -g)
		stty raw -echo
		answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
		stty $old_stty_cfg && echo
		if echo "$answer" | grep -iq "^y" ;then
			chsh -s $(which zsh)
		else
			printf "\xE2\x9A\xA0 Warning: Your configuration won't work properly. If you exec zsh, it'll exec tmux which will exec your default shell which isn't zsh."
		fi
	fi
}

echo "This is the dotfiles installer. We are going to do the following things:"
echo "1. Install dependencies"
echo "2. Check to make sure you have zsh, vim, and tmux installed"
echo "3. We'll help you install them if you don't"
echo "4. We're going to check to see if your default shell is zsh"
echo "5. We'll try to change it if it's not" 

echo "Let's get started? (y/n)"
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
	echo 
else
	echo "Quitting, nothing was changed."
	exit 0
fi

git submodule update --init --recursive
check_for_software zsh
echo 
check_for_software vim
echo
check_for_software tmux
echo

check_default_shell

echo
printf "\nWould you like to backup your current dotfiles? (y/n) "
old_stty_cfg=$(stty -g)
stty raw -echo
answer=$( while ! head -c 1 | grep -i '[ny]' ;do true ;done )
stty $old_stty_cfg
if echo "$answer" | grep -iq "^y" ;then
	mv ~/.zshrc ~/.zshrc.old
	mv ~/.tmux.conf ~/.tmux.conf.old
	mv ~/.vimrc ~/.vimrc.old
    printf "\n\xE2\x9C\x94 old dotfiles have been backed up."
else
	printf "\nNot backing up old dotfiles."
fi

printf "source '$HOME/.dotfiles/zsh/zshrc_manager.sh'" > ~/.zshrc
printf "so $HOME/.dotfiles/vim/vimrc.vim" > ~/.vimrc
printf "source-file $HOME/.dotfiles/tmux/tmux.conf" > ~/.tmux.conf
cp ./dir_colors ~/.dir_colors

echo
echo "Please log out and log back in for default shell to be initialized."