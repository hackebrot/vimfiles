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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'alfredodeza/pytest.vim'
Plugin 'rking/ag.vim'

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
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"================
"NERDTree
"================
"Ignore *.pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"================
"Jedi-Vim
"================
"Disable auto completion
let g:jedi#completions_enabled = 0

"Do not automatically insert `import`
let g:jedi#smart_auto_mappings = 0

"================
"Airline
"================
"Set theme for vim-airline
let g:airline_theme = 'base16'
let g:airline_extensions = ['ctrlp', 'whitespace', 'tabline']

"Show tab number and number of splits in tabline
let g:airline#extensions#tabline#tab_nr_type = 2

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

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

"Always display status line
set laststatus=2

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

"Switch to split
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"Maximize current vertical split
nnoremap <Leader><Leader> <C-W><Bar>0
nnoremap <Leader>= <C-W>=

"Move to the next buffer
nmap <leader>j :bnext<CR>

"Move to the previous buffer
nmap <leader>k :bprevious<CR>

"Close buffer and go back to previous one
nmap <leader>bq :bp <BAR> bd #<CR>

"Use jk to leave insert mode
inoremap jk <ESC>

"Restore visual selection after changing the level of indentation
vnoremap > >gv
vnoremap < <gv

"Open NERDTree in all tabs with space+t
nnoremap <Leader>t :NERDTreeTabsToggle<CR>
"
"Select current file in NERDTree
nnoremap <Leader>s :NERDTreeTabsFind<CR>

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
