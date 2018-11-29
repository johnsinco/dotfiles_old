" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" John's .vimrc file
"

" Remap leader to comma
let mapleader=","


" =========================  General Config  =================================
set number                                  " turn on line numbers
set backspace=2                             " backspace like other programs
set noswapfile                              " dont save swap files
set nobackup
set nowb
set history=100                             " store previous commands
set showmode                                " show mode at bottom
set showcmd                                 " show incomplete commands
set nowrap				    " no wrapping
set scrolloff=2                             " 2 lines below the scroll point
set smartindent
" set lazyredraw                              
" set re=2

syntax on                                   " always do syntax highlighting
set nocompatible                            " We're running Vim, not Vi!
filetype on                                 " Enable filetype detection
filetype indent on                          " Enable filetype-specific indenting
filetype plugin on                          " Enable filetype-specific plugins
"
let loaded_matchparen = 1		    " turn off match parens until I can fix weird highlighting

" ==================== SETUP VIM Plugins via vim-plug  ======================
" install vim-plug if it doesnt exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"  vim-plug setup
call plug#begin('~/.vim/plugged')


" ===================  VIM plugins  ========================================
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'raimondi/delimitmate'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ruby-matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'janko-m/vim-test'
" Plug 'skalnik/vim-vroom'

" Plug 'vim-airline/vim-airline'
" Plug 'edkolev/tmuxline.vim'

" Initialize plugin system
call plug#end()

" NerdTree setup
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>v :NERDTreeFind<CR>
" commands below make scrolling super slow...  why?  
" autocmd vimenter * NERDTree
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" move between buffers / tmux panes
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l


" split vim windows with 'vv' and 'ss'
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" yank whole word from the middle
nnoremap ,yw yiww

" jump to first character
nnoremap 0 ^
nnoremap ^ 0

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

map ,` ysiw`

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

"Go to last edit location with ,.
nnoremap ,. '.

" jump out of quotes
imap <C-q> <esc>wa

" insert pry command
iabbr bpry require'pry';binding.pry

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
nmap <silent> // :nohlsearch<CR>

" ================== FZF file finder =================
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ================= Ack.vim file search ==============
" This uses Ack.vim to search for the word under the cursor
nnoremap <leader><bs> :Ag! '\b<c-r><c-w>\b'<cr>
nnoremap <leader>a :Ag
nmap <M-k> :Ack! "\b<cword>\b" <CR>


" ==============  Colors  ==========================
color atom-dark


" ==============  Ruby stuff =======================
imap <S-CR>    <CR><CR>end<Esc>-cc


" ============== VIM test plugin bindings ==========
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
