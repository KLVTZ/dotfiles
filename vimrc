set nocompatible
filetype on
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
"set list

colorscheme kolor

set listchars=tab:☠\ ,eol:¬
set laststatus=2
set ttimeoutlen=50

" abbreviations
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

" artisan generator
abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

"map keys

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

nmap <leader>l :set list!<CR>"
" Toggle spell checking on and off with `,s`
" Gundo for branching diff within file history
nnoremap <F6> :GundoToggle<CR>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Edit todo list for projects
nmap ,todo :e todo.txt<cr>


" Practice muscle memory for using the h j k l keys for direction.
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" optional setting for not pulling up these folders/files when calling CtrlP
" Laravel specific
set wildignore+=*/vendor/**
set wildignore+=*public/forum/**

" Captial W and Q for write and quit
:command WQ wq
:command Wq wq
:command Q q
:command W w

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Open Vim on startup, left.
autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "left"

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype on

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

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Functions
function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let l:win_view = winsaveview()
	let l:last_search = getreg('/')
	"
	" execute the command without adding to the changelist/jumplist:
	execute 'keepjumps ' . a:command
	"
	" Clean up: restore previous search history, and cursor position
	call winrestview(l:win_view)
	call setreg('/', l:last_search)
endfunction

" Delete trailing whitespace
nnoremap <unique> <silent> <leader>dw :call Preserve("%s/\\s\\+$//e")<cr>
"
" " Reindent entire file
nnoremap <unique> <silent> <leader>e :call Preserve("normal! gg=G")<CR></cr></leader></silent></unique></cr></leader></silent></unique>

set term=xterm-256color
"let g:airline_theme = 'base16'
"let g:airline_theme = 'luna'

" Command for soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist


" Bubble up Text
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" ControlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" status line for fugitive
let g:airline#extensions#branch#enabled=1

" Laravel 4 Snippet loader under PHP
" autocmd FileType php set ft=php.laravel
