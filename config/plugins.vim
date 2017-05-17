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

let g:go_auto_type_info = 0
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
