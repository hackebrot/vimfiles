set nocompatible              " be iMproved, required
filetype off                  " required
syn on

"================
"Read aliases
"================
let $BASH_ENV = "~/.bash_aliases"

"================
"Plugins
"================

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

source $HOME/.config/nvim/plug.vim

" Initialize plugin system
call plug#end()

"================
"Load configs
"================
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

"================
"Directories
"================
"Use dedicated locations for vim files (see http://stackoverflow.com/a/15317146)
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set undodir=~/.local/share/nvim/undo//
