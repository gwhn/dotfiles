filetype off
call pathogen#infect()
filetype plugin indent on
" Search down into subfolders
set path+=**
" Display matching files on tab completion
set wildmenu
" Use the Base16 Ocean Dark theme
set background=dark
colorscheme base16-ocean
let g:base16_ocean_termtrans=1
" Quick escaping
inoremap jj <ESC>
" Auto-indenting
set autoindent
" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set hidden
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
set wildmode=list:longest
set visualbell
set undofile
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=0
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Tame searching/moving
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
" Font type and size setting.
if has('win32')
  set guifont=Consolas:h11                          " Win32.
elseif has('gui_macvim')
  set guifont=Source\ Code\ Pro\ Medium:h11         " OSX.
else
  set guifont=Monospace\ 11                         " Linux.
endif
set linespace=1
" Handle long lines nicely
set wrap
set textwidth=79
set formatoptions=qrn1t
set colorcolumn=85
" Get into good habits by disabling arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Make j and k move up and down by screen line, not file line
nnoremap j gj
nnoremap k gk
" Disable F1 because it's too close to ESC
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Save on losing focus
au FocusLost * :wa
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
set smartcase
" Highlight dynamically as pattern is typed
set incsearch
set showmatch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use par to format paragraphs using gqip chord
set formatprg=par
" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif