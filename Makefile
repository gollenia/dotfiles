CC = cc

all: say_hello generate

say_hello:
	@echo "Installing command line Settings"

generate:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	cp .tmux.conf ~/
	cp .vimrc ~/
	cp .profile ~/
	vim +PlugInstall +qall

clean:
	rm hello
