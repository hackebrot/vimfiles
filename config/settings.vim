"Set colorscheme
colorscheme neodark

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

"Disable beeping and flashing when an error occurs
set noerrorbells
set visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"Use markdown syntax highlighting for lektor content files
au BufRead,BufNewFile *.lr setfiletype markdown
