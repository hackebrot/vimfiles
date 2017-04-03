set nocompatible              " be iMproved, required
filetype off                  " required
syn on

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'foosoft/vim-argwrap'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/seoul256.vim'
Plug 'keitanakamura/neodark.vim'
Plug 'kien/ctrlp.vim'
Plug 'maralla/completor.vim'
Plug 'nvie/vim-flake8'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

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
"vim-go
"================
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 0

let g:go_auto_type_info = 1
let g:go_echo_command_info = 0
let g:go_fmt_command = 'goimports'
let g:go_list_type = 'quickfix'

let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

"================
"Airline
"================
"Set theme for vim-airline
let g:airline_extensions = ['ctrlp', 'whitespace', 'tabline']

"Show tab number and number of splits in tabline
let g:airline#extensions#tabline#tab_nr_type = 2

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"================
"NeoDark
"================
let g:neodark#use_256color = 1

"================
"Seoul256
"================
" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
let g:seoul256_light_background = 255

"================
"Maximizer
"================
let g:maximizer_default_mapping_key = '++'

"================
"ArgWrap
"================
let g:argwrap_tail_comma = 1

"================
"Read aliases
"================
let $BASH_ENV = "~/.bash_aliases"

"================
"SETTINGS
"================
colorscheme neodark
"
"Display line numbers
set relativenumber
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

"When a bracket is inserted, briefly jump to the matching one
set showmatch

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

"Use markdown syntax highlighting for lektor content files
au BufRead,BufNewFile *.lr setfiletype markdown

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

"Move to the next buffer
nmap <leader>e :bnext<CR>

"Move to the previous buffer
nmap <leader>a :bprevious<CR>

"Close buffer and go back to previous one
nmap <leader>r :bp <BAR> bd #<CR>

"List open buffers
nmap <leader>bl :ls<CR>

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

"ArgWrap toggle wrapping of collections in code
nnoremap <silent> <Leader>j :ArgWrap<CR>

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
