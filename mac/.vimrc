"      __                __  .__
"     |__|__ __  _______/  |_|__| ____   ___________     ____   ____
"     |  |  |  \/  ___/\   __\  |/    \  \____ \__  \   / ___\_/ __ \
"     |  |  |  /\___ \  |  | |  |   |  \ |  |_> > __ \_/ /_/  >  ___/
" /\__|  |____//____  > |__| |__|___|  / |   __(____  /\___  / \___  >
" \______|          \/               \/  |__|       \//_____/      \/
"
" ----------------------------------------------------------------------------
" Normal Setters and Letters
" ----------------------------------------------------------------------------
set nocompatible
filetype plugin indent on
syntax on

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
set term=xterm-256color
let base16colorspace=256
set autoindent
set smartindent
set laststatus=2
set ttimeoutlen=50
set textwidth=80

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ControlP plugin
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Invisible chars
set listchars=tab:☠\ ,eol:¬

" ----------------------------------------------------------------------------
" Colorscheme and settings for styling
" ----------------------------------------------------------------------------

colorscheme base16-atelier-cave-light

" ----------------------------------------------------------------------------
" Abbreviations
" ----------------------------------------------------------------------------

cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Mapping for correct regular expression under magic mode
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Toggle NERDTree
nnoremap <C-b> :NERDTreeToggle<cr>

" ctags generator
nnoremap <f8> :!ctags -R .<cr>

" Hide currently highlighted search
nnoremap <leader><space> :noh<cr>

" Turn on EOL symbol
nmap <leader>l :set list!<CR>

" Gundo for branching diff within file history
nnoremap <F6> :GundoToggle<CR>

" Easier window navigation
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

" Syntastic
nnoremap <F9> :SyntasticToggleMode<CR>
let g:syntastic_mode_map = { 'mode' : 'active',
			\ 'active_filetypes': [],
			\ 'passive_filetypes': ['typescript'] }


" Bubble up Text
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Easy Align
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" CtrlP mapping --fuzzy searching
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme= "base16"
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" Gist
let g:gist_clip_command = 'pbcopy'

"SnipMate
let g:snipMate = {}
let g:snipMate.snippet_version = 1

" ----------------------------------------------------------------------------
" Custom Commands
" ----------------------------------------------------------------------------

" Captial W and Q for write and quit
:command! WQ wq
:command! Wq wq
:command! Q q
:command! W w
:command! Bn bn
:command! Bp bp

" Soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Fix 256-color in tmux and vim
if &term =~ '256color'
	set t_ut=
endif

" Underline spelling mistakes
highlight SpellBad cterm=underline

" Use color highlight for line number
hi CursorLineNr term=bold cterm=none ctermfg=012 gui=bold
function! s:goyo_leave()
	colorscheme base16-atelier-cave-light
	hi CursorLineNr term=bold cterm=none ctermfg=012 gui=bold
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()
