set nocompatible 

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
set noshowmode
if !has('gui_running')
	  set t_Co=256
endif


call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'itchyny/lightline.vim'
	Plug 'scrooloose/nerdcommenter'
	Plug 'arcticicestudio/nord-vim'
	Plug 'ap/vim-css-color'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'pangloss/vim-javascript'
	Plug 'elzr/vim-json'
	Plug 'mxw/vim-jsx'
	Plug 'millermedeiros/vim-esformatter'
	Plug 'leafgarland/typescript-vim'
	Plug 'prettier/vim-prettier'
	Plug 'emmetio/emmet'
call plug#end()
