" this config file is shared between vim and nvim

set nocompatible

" airline
let g:airline_powerline_fonts = 1

" tab, indent, and backspace
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
let g:leave_my_textwidth_alone = 1
set backspace=indent,eol,start

" honor modeline
set modeline
set modelines=2

" line numbering and scrolling
function! ToggleNumbers()
    if (&relativenumber == 1)
        set number
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunction

autocmd BufEnter * set number
autocmd BufEnter * set relativenumber
set cursorline
set scrolloff=3

" key mappings
let mapleader = ","
nnoremap <C-k> <PageUp>
nnoremap <C-j> <PageDown>
nnoremap <C-n> :call ToggleNumbers()<cr>
vnoremap <C-s> :sort<cr>
map <Left> <Nop>
map <Up> <Nop>
map <Down> <Nop>
map <Right> <Nop>

" color settings
set t_Co=256
colorscheme fatedmariner
syntax on

" search settings
set hlsearch
set incsearch

" other settings
set nobackup
set encoding=utf-8
set laststatus=2
set clipboard=unnamedplus
