set nocompatible              " be iMproved, required
filetype off                  " required
syn on

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

source $HOME/.config/nvim/plug.vim

" Initialize plugin system
call plug#end()

source $HOME/.config/nvim/plugins.vim
