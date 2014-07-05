set nocompatible
syntax on
filetype off

"""
"behavior
"""

"code folding
set foldmethod=indent
set foldlevel=99

"auto reload .vimrc on write
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

"""
"appearance
"""

"line numbers
set number

"show whitespace
set list listchars=trail:-

"colors
set t_Co=256
color wombat256mod
 
"long line barrier
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=233
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"highlight long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929                      
match OverLength /\%81v.\+/


"""
"Keyboard convenience
"""

"map leader
let mapleader = ","

filetype plugin on
filetype indent on

"this block enable ctrl and alt key combos in terminator
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

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

"format paragraphs with Q
vmap Q qq
nmap Q gqap

"tab navigation
nnoremap tk :tabprevious<CR>
nnoremap tj :tabnext<CR>
nnoremap tt :tabnew<CR>
map tx :tabclose<CR>

"""
"Pathogen
"""
call pathogen#infect()

" ============================================================================
" Python IDE Setup from youtube video and github
" https://github.com/mbrochh/vim-as-a-python-ide/blob/master/.vimrc
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

