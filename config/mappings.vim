"Change leader to space
let mapleader = "\<Space>"

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
