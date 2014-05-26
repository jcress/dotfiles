set nocompatible
syntax on
filetype off

"spaces not tabs
set expandtab
set autoindent
set autoread

set backspace=indent,eol

"mapping tasklist prevents the plugin from trying to
nnoremap <leader>v <Plug>TaskList

filetype plugin on
filetype indent on

"code folding
set foldmethod=indent
set foldlevel=99

"window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

