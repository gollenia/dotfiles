CC = cc

all: say_hello generate

say_hello:
	@echo "Installing command line Settings"
	@echo "Please install zsh and tmux manually, if not hapened yet

generate:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp .tmux.conf ~/
	cp .vimrc ~/
	cp .profile ~/
	cp -R .vim ~/
	vim +PlugInstall +qall

clean:
	rm hello
