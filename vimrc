set nocompatible | filetype indent plugin on | syn on

"================
"LaTeX
"================
"Those settings have been pointed out during installation of vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after


"================
"VAM
"================

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons(['ctrlp'], {'auto_install' : 0})
  call vam#ActivateAddons(['vim-multiple-cursors'], {'auto_install' : 0})
  call vam#ActivateAddons(['seoul256'], {'auto_install' : 0})
  call vam#ActivateAddons(['The_NERD_Commenter'], {'auto_install' : 0})
endfun

call SetupVAM()
VAMActivate matchit.zip vim-addon-commenting


"================
"CTRL-P
"================
set wildignore+=*.pyc


"================
"SETTINGS
"================
colorscheme seoul256-light
"
"Display line numbers
set number

"Use unix fileformat
set fileformat=unix

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

"Create a split when switching to a different buffer
set switchbuf+=split

"Use intuitive alignment for new splits
set splitright
set splitbelow

"Indicate max line length. Set to 79 as defined in Pythons PEP 8
execute "set colorcolumn=" . join(range(80,400), ',')

"Display the cursors current column and line
set cursorline
set cursorcolumn
highlight colorcolumn term=bold cterm=bold ctermbg=8 guibg=Gray80
highlight cursorcolumn term=bold cterm=bold ctermbg=8 guibg=Gray80

"Extend backspace capabilities
set backspace=indent,eol,start

"Case sensitive basic search only if pattern contains uppercase char
set ignorecase 
set smartcase

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
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>f :CtrlPMRU<CR>
nnoremap <Leader>w :w<CR>

"Switch to split and maximize it
nnoremap <C-H> <C-W>h<C-W><Bar>
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-L> <C-W>l<C-W><Bar>

"Use jk to leave insert mode
inoremap jk <ESC>

"Restore visual selection after changing the level of indentation
vnoremap > >gv
vnoremap < <gv
