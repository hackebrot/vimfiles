set nocompatible | filetype indent plugin on | syn on

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
  call vam#ActivateAddons(['ctrlp', 'vim-multiple-cursors', 'seoul256'], {'auto_install' : 0})
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
set scrolloff=5 sidescrolloff=5
set hlsearch
set incsearch
set number
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set nowrap
set showmatch
set switchbuf+=split

execute "set colorcolumn=" . join(range(81,400), ',')
highlight colorcolumn term=bold cterm=bold ctermbg=8 guibg=Gray80
set cursorline
set cursorcolumn
highlight cursorcolumn term=bold cterm=bold ctermbg=8 guibg=Gray80


"================
"MAPPING
"================
let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>f :CtrlPMRU<CR>
