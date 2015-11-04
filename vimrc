set nocompatible              " be iMproved, required
filetype off                  " required
syn on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"================
"CTRL-P
"================
set wildignore+=*.pyc
let g:ctrlp_working_path_mode = ''

"================
"NERDTree
"================
"Ignore *.pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"================
"Read aliases
"================
let $BASH_ENV = "~/.bash_aliases"

"================
"SETTINGS
"================
colorscheme seoul256
"
"Display line numbers
set number

"Use unix fileformat
set fileformat=unix

"Use unicode encoding
set encoding=utf-8

"Start scrolling before reaching a window border
set scrolloff=5 sidescrolloff=5

"Highlight search matches
set hlsearch

"Jump to match while typing the search pattern
set incsearch

"Start at the indentation level of the prev line
set autoindent

"Use 4 spaces instead of a tab
set expandtab
set tabstop=4
set shiftwidth=4

"Do not wrap long lines
set nowrap

"Enable folding
set foldmethod=indent
set foldlevel=99

"Create a split when switching to a different buffer
set switchbuf+=split

"Use intuitive alignment for new splits
set splitright
set splitbelow

"Indicate max line length. Set to 79 as defined in Pythons PEP 8
execute "set colorcolumn=" . join(range(80,400), ',')

"Display the cursors current line
set cursorline

"Extend backspace capabilities
set backspace=indent,eol,start

"Case sensitive basic search only if pattern contains uppercase char
set ignorecase 
set smartcase

"Automatically reload buffers on file changes
set autoread

"Turn on backups
set backup
set writebackup

"Enable 7.3 persistent undo feature
set undofile
set undolevels=1000
set undoreload=10000

"Use dedicated locations for vim files (see http://stackoverflow.com/a/15317146)
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"Disable beeping and flashing when an error occurs
set noerrorbells
set visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"================
"MAPPING
"================
"Change leader to space
let mapleader = "\<Space>"

"Open file and open most recently used
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>f :CtrlPMRU<CR>

"Write and close file
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

"Switch to split and maximize it
nnoremap <C-H> <C-W>h<C-W><Bar>0
nnoremap <C-J> <C-W>j<C-W>_0
nnoremap <C-K> <C-W>k<C-W>_0
nnoremap <C-L> <C-W>l<C-W><Bar>0

"Use jk to leave insert mode
inoremap jk <ESC>

"Restore visual selection after changing the level of indentation
vnoremap > >gv
vnoremap < <gv

"Open NERDTree with space+t
nnoremap <Leader>t :NERDTreeToggle<CR>

"================
"FUNCTIONS
"================
" Add argument (can be negative, default 1) to global variable i.
" Return value of i before the change.
" See http://vim.wikia.com/wiki/Making_a_list_of_numbers
function Inc(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction
