set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Themes
Plugin 'altercation/vim-colors-solarized'

" Syntax
Plugin 'jelera/vim-javascript-syntax'
Plugin 'skammer/vim-css-color'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'digitaltoad/vim-jade'

" Functionality

" ### Indispensable

" ctrlp is file fuzzy search
Plugin 'kien/ctrlp.vim'
"Airline provides a stylish appearance for the styleline
Plugin 'bling/vim-airline'
"Provides Sublime-Text like smart completion of braces, parens and such
Plugin 'Raimondi/delimitMate'

" ### Use sometimes

" fugitive provides git bindings in Vim.  Don't use too much, but useful for blame
Plugin 'tpope/vim-fugitive'
" Provides easy shortcuts for commenting out lines
Plugin 'scrooloose/nerdcommenter'
"
Plugin 'nathanaelkane/vim-indent-guides'
"
Plugin 'camelcasemotion'
call vundle#end()
filetype plugin indent on
runtime! macros/matchit.vim

syntax on
set t_Co=256
set background=dark
colorscheme solarized
set gfn=Inconsolata\ for\ Powerline\ 20
set noshowmode

set encoding=utf-8
set number
set relativenumber
set statusline=%<%t\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
set backspace=indent,eol,start
set history=1024
set showcmd
set gcr=a:blinkon0
set autoread
set laststatus=2
set hidden
set shortmess=filnxtToOI

set ttyfast

set incsearch
set hlsearch
set viminfo='100,f1

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set undodir=~/.vim/backups
set undofile

set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set nowrap
set foldmethod=indent
set foldnestmax=3
set nofoldenable

set wildmode=longest,list,full
set wildmenu
set wildignore=*~
set wildignore+=*vim/backups*

set scrolloff=5
set sidescrolloff=15
set sidescroll=1

set visualbell
set t_vb=
set noerrorbells

set guioptions-=m
set guioptions-=T
set guioptions-=r

let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$'
  \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

map <leader>rr :source ~/.vimrc<CR>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

map <silent> <F2> :set nolist!<CR>:IndentGuidesToggle<CR>
map <silent> <F3> :let @/ = ""<CR>

autocmd FileType c,cpp,java,php,javascript,jade,css autocmd BufWritePre <buffer> :%s/\s\+$//e
