set nocompatible 
"let g:airline_powerline_fonts = 1
"let g:airline_theme='nord'
"let g:airline_section_a = 'Whatever'
let g:airline#extensions#whitespace#enabled = 0
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <SPACE> <Nop>
let mapleader = " "

nnoremap <C-a> :ToggleBool<CR>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

set laststatus=2
set timeoutlen=1000 ttimeoutlen=0
set noshowmode
set number
if !has('gui_running')
	set t_Co=256
endif

nnoremap <CR> G

" Add W command to write with sudo
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-unimpaired'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	Plug 'scrooloose/nerdcommenter'
	Plug 'ap/vim-css-color'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'pangloss/vim-javascript'
	Plug 'elzr/vim-json'
	Plug 'mxw/vim-jsx'
	Plug 'prettier/vim-prettier'
	Plug 'emmetio/emmet'
	Plug 'https://github.com/sagarrakshe/toggle-bool'
call plug#end()
colorscheme material 
