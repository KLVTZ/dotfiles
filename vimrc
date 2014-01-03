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
"set list
syntax on
set number
set t_Co=256

let g:kolor_italic=1                    " Enable italic. Default: 1
let g:kolor_bold=1                      " Enable bold. Default: 1
let g:kolor_underlined=0                " Enable underline for 'Underlined'. Default: 0
let g:kolor_alternative_matchparen=0    " Gray 'MatchParen' color. Default: 0
colorscheme kolor 

set listchars=tab:☠\ ,eol:¬
set laststatus=2
set ttimeoutlen=50

"map keys
nmap <leader>l :set list!<CR>"
	" Toggle spell checking on and off with `,s`
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>



" Captial W and Q for write and quit
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

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

  " strip white space
  function! <SID>StripTrailingWhitespaces()
	  " prep: save last search, and cursor position
	  let _s=@/
	  let l = line(".")
	  let c = col(".")
	  " do business:
	  %s/\s\+$//e
	  " clean up: restore previous search history, and cursor position
	  let @/=_s
	  call cursor(l,c)
  endfunction
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

set term=xterm-256color
"let g:airline_theme = 'base16'
"let g:airline_theme = 'luna'

" Command for soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Open Vim on startup, left.
autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "left"
