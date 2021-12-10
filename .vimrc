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
set autoread
set foldmethod=manual
set regexpengine=1
set re=1
set list
set listchars=tab:>-
" hack to try to speed up slow ruby files
set synmaxcol=120                           " try to speed up long lines by not syntaxing them"
syntax off
set synmaxcol=400                           " try to speed up long lines by not syntaxing them"
syntax on

" set smartindent
set tabstop=2 shiftwidth=2 expandtab
" set expandtab
" https://stackoverflow.com/questions/7655382/javascript-syntax-indentation-in-vim/43249918
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set nocompatible                            " We're running Vim, not Vi!
syntax on                                   " always do syntax highlighting
filetype on                                 " Enable filetype detection
filetype indent on                          " Enable filetype-specific indenting
filetype plugin on                          " Enable filetype-specific plugins
"
" try to fix slow ruby syntax and scrolling
let loaded_matchparen = 1		    " turn off match parens because its too slow
let matchparen_timeout = 50		    " matchparen vim plugin is too slow
let ruby_no_expensive = 1		    " turn off expensive ruby highlighting
let ruby_minlines = 500

" reload files when changed on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

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
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'ludovicchabant/vim-gutentags'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/ruby-matchit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-scripts/supertab'
" Plug 'jiangmiao/auto-pairs'
" Plug 'mxw/vim-jsx'
" Plug 'pangloss/vim-javascript'
" Plug 'janko-m/vim-test'
" Plug 'skalnik/vim-vroom'

" Plug 'vim-airline/vim-airline'
" Plug 'edkolev/tmuxline.vim'
" Plug 'elixir-lang/vim-elixir'
Plug 'elixir-editors/vim-elixir'
" Plug 'hashivim/vim-terraform'
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'flazz/vim-colorschemes'
Plug 'yous/vim-open-color'
" Plug 'lambdatoast/elm.vim'
" Plug 'swalladge/paper'
" Plug 'scrooloose/syntastic'

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

" disable downcase for safety
xnoremap u <nop>

" split vim windows with 'vv' and 'ss'
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" yank whole word from the middle
nnoremap ,yw yiww

" jump to first character
nnoremap 0 ^
nnoremap ^ 0

" jump out of quotes
nnoremap <S-Tab> <esc>la

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
iabbr birb binding.irb
iabbr biex require IEx ;IEx.pry

" insert co-authored by marc
" iabbr co-marc Co-authored-by: marc <marrrc.b@gmail.com>

" ,q to toggle quickfix window (where you have stuff like Ag)
" ,oq to open it back up (rare)
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

" show hidden chars
" set listchars=tab:▸\
" set listchars+=eol:¬
" set listchars+=trail:·

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
nmap <silent> // :nohlsearch<CR>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>'")

" ================== FZF file finder =================
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>r :Tags<CR>

" ================= Ack.vim file search ==============
" This uses Ack.vim to search for the word under the cursor
nnoremap <leader><bs> :Ag! '\b<c-r><c-w>\b'<cr>
nnoremap <Leader>a y:Ack! <C-r>=fnameescape(@")<CR><CR>")
nmap <M-k> :Ack! "\b<cword>\b" <CR>


" ==============  Colors  ==========================
" color atom-dark
" color railscasts
color open-color
" color solarized
" color paper


" ==============  Ruby stuff =======================
imap <S-CR>    <CR><CR>end<Esc>-cc
" autocmd FileType ruby compiler ruby
" autocmd FileType ruby map <F9> :w<CR>:!ruby -c %<CR>

" ============== VIM test plugin bindings ==========
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" ================ syntastic =====================
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_ruby_checkers = ['rubocop']
"
" ==== markdown preview
let vim_markdown_preview_github=1

" ==== terraform ======
let g:terraform_align=1
let g:terraform_fmt_on_save=1


" === 24 bit color support ====
if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
	if has('termguicolors')
		" See :help xterm-true-color
		if $TERM =~# '^screen'
			let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
			let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
		endif
		set termguicolors
	endif
endif
