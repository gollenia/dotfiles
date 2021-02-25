git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp .tmux.conf ~/
cp .vimrc ~/
cp .profile ~/
vim +PlugInstall +qall
