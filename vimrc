" vim: foldmethod=marker
set nocompatible
filetype on
filetype indent on
filetype plugin on

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

"set list
syntax on
set number
set t_Co=256
set smartindent

let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline for 'Underlined'. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
colorscheme kolor

set listchars=tab:☠\ ,eol:¬
set laststatus=2
set ttimeoutlen=50

" abbreviations
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

"map keys

"mapping for correct regular expression under magic mode
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" hide currently highlighted search
nnoremap <leader><space> :noh<cr>

nmap <leader>l :set list!<CR>"
" Toggle spell checking on and off with `,s`
" Gundo for branching diff within file history
nnoremap <F6> :GundoToggle<CR>

" Practice muscle memory for using the h j k l keys for direction.
noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

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

" autocompletion
function! InsertTabWrapper()
	let col = col(".") - 1
	if !col || getline(".")[col -1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-n>"
	endfunction

	inoremap <tab> <c-r>=InsertTabWrapper()<cr>
	inoremap <s-tab> <c-p>
