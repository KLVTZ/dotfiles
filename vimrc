"  ____  __.____ ____   _________________________
"  |    |/ _|    |\   \ /   /\__    ___/\____    /
"  |      < |    | \   Y   /   |    |     /     /
"  |    |  \|    |__\     /    |    |    /     /_
"  |____|__ \_______ \___/     |____|   /_______ \
"          \/       \/                          \/
"
" ----------------------------------------------------------------------------
" Normal Setters and Letters
" ----------------------------------------------------------------------------
set nocompatible
filetype plugin indent on
syntax on

call pathogen#infect()

let mapleader = ","
set ignorecase
set hlsearch
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartcase
set gdefault
set incsearch
set showmatch
set noswapfile
set visualbell
set cursorline
set hidden
set linebreak
set scrolloff=5
set showcmd
set number
set t_Co=256
set autoindent
set smartindent
set laststatus=2
set ttimeoutlen=50
set t_ut=

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ControlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ----------------------------------------------------------------------------
" Colorscheme and settings for styling
" ----------------------------------------------------------------------------

colorscheme kolor
let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0

set term=xterm-256color

" ----------------------------------------------------------------------------
" Abbreviations
" ----------------------------------------------------------------------------

cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap
"
" artisan generator
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

"mapping for correct regular expression under magic mode
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

"Easy escapping to normal mode
inoremap jj <esc>

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

nnoremap <C-b> :NERDTreeToggle<cr>

" hide currently highlighted search
nnoremap <leader><space> :noh<cr>

" turn on EOL symbol
nmap <leader>l :set list!<CR>"

" Gundo for branching diff within file history
nnoremap <F6> :GundoToggle<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Delete whitespace
nnoremap <leader>W mz:%s/\s\+$//<CR>:let @/=''<CR>`z

" Reindent file
nnoremap <leader>ef mfgg=G`z<CR>

" Edit todo list for projects
nmap ,todo :e todo.txt<cr>

" Practice muscle memory for using the h j k l keys for direction.
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

" Map Goyo toggle to <leader> + z
nnoremap <Leader>z :Goyo<CR>

" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :set spell!<CR>

" Bubble up Text
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" CtrlP mapping --fuzzy searching
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" optional setting for not pulling up these folders/files when calling CtrlP
" Laravel specific
set wildignore+=*/vendor/**
set wildignore+=*public/forum/**

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '

" ----------------------------------------------------------------------------
" Custom Commands
" ----------------------------------------------------------------------------

" Captial W and Q for write and quit
:command! WQ wq
:command! Wq wq
:command! Q q
:command! W w

" Open Vim on startup, left.
" autocmd VimEnter * NERDTree
" let g:NERDTreeWinPos = "left"

" soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist

"Laravel 4 Snippet loader under PHP
" autocmd FileType php set ft=php.laravel

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Syntax of these languages languages is fussy over tabs Vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

	" Treat .rss files as XML
	autocmd BufNewFile, BufRead *.rss setfiletype xml
endif
