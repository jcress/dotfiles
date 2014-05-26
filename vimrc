set nocompatible
syntax on
filetype off

"auto reload .vimrc
autocmd! bufwritepost vimrc source %

"copy paste
set pastetoggle=<F2>
set clipboard=unnamed

"spaces not tabs
set expandtab
set autoindent
set autoread

set showtabline=2
set shiftwidth=4
set ruler

set backspace=indent,eol

"map leader
let mapleader = ","

"""
"appearance
"""

"line numbers
set number

"show whitespace
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

"colors
set t_Co=256
color wombat256mod
 
"long line barrier
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"this block enable ctrl and alt key combos in terminator
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

"mapping tasklist prevents the plugin from trying to
nnoremap <leader>v <Plug>TaskList

filetype plugin on
filetype indent on

"code folding
set foldmethod=indent
set foldlevel=99

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

"tab navigation
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

"alphabetical sorting
vnoremap <Leader>s :sort<CR>

"better moving of code blocks
vnoremap < <gv 
vnoremap > >gv 

