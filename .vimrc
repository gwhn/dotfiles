set nocompatible              " be iMproved, required
filetype off                  " required

" Configure Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-unimpaired'
Plugin 'tyru/open-browser.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'wincent/command-t'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe' " NOTE: must come after supertab
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'justinmk/vim-sneak'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown' " NOTE: must come after tabular
Plugin 'mattn/emmet-vim'
Plugin 'fatih/vim-go'
Plugin 'ryanoasis/vim-devicons' " NOTE: must come after NERDTree and airline
Plugin 'kshenoy/vim-signature'
Plugin 'wincent/ferret'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" Options {{{

" Search down into subfolders
set path+=**

" Auto-indenting
set autoindent

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set hidden
set clipboard=unnamed

" Enhance command-line completion
set wildmenu
set wildmode=list:longest

" File patterns to ignore
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.orig                           " Merge resolution files

" No beeping at me!
set visualbell

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

" Auto read and write
set autoread
set autowrite

" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable more history
set history=1000

" Enable backup and disable swap file
set backup
set noswapfile

" Auto save undo history
set undofile

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
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

" set dark background
set background=dark

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2
set shiftround
set shiftwidth=2
set softtabstop=2
set expandtab

" Timeout on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=10

" Set updatetime
set updatetime=1000

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set list

" Show breaks
set showbreak=↪

" Split new windows below and right
set splitbelow
set splitright

" Set lazyredraw. To force :redraw
set lazyredraw

" Font type and size setting.
if has('win32')
  set guifont=Consolas:h11                        " Win32.
elseif has('gui_macvim')
  set guifont=SauceCodePro\ Nerd\ Font\ Light:h11 " OSX.
else
  set guifont=Monospace\ 11                       " Linux.
endif

" Don't pad line height ( GUI specific )
set linespace=0

" Handle long lines nicely
set linebreak
set wrap
set textwidth=80
set formatoptions=qrn1t
set colorcolumn=+1

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

" Start scrolling three lines before the horizontal window border
set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" Start with fold closed
set foldlevelstart=0

" Allow virtual editing in Visual block mode
set virtualedit+=block

" }}}

" Abbreviations {{{

iabbrev guy@ guy@weblitz.co.uk
iabbrev gwhn@ guy@weblitz.co.uk

" }}}

" Auto-commands {{{

" Save on losing focus
au FocusLost * :silent! wall

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" }}}

" Themes {{{

" Configure base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  source ~/.vimrc_background
endif

" }}}

" Leaders {{{

" Change mapleader to <space> key
let mapleader = "\<space>"
"nnoremap <leader> <space>
" Change maplocalleader to <cr> key
let maplocalleader = "\<cr>"
"nnoremap <localleader> <cr>

" }}}

" Key-mappings {{{

" Quick escaping
inoremap jk <esc>

" Tame searching/moving
nnoremap / /\v
vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %

" Get into good habits by disabling arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" And backspace and escape in insert mode
inoremap <bs> <nop>
inoremap <esc> <nop>

" Make j and k move up and down by screen line, not file line
nnoremap j gj
nnoremap k gk

" Change window navigation mapping
nnoremap <c-j> <c-w>j<c-w>_
nnoremap <c-k> <c-w>k<c-w>_
nnoremap <c-l> <c-w>l<c-w>_
nnoremap <c-h> <c-w>h<c-w>_

" Create a split on the given side
nnoremap <leader>hh :leftabove vsp<cr>
nnoremap <leader>ll :rightbelow vsp<cr>
nnoremap <leader>kk :leftabove sp<cr>
nnoremap <leader>jj :rightbelow sp<cr>

" Disable F1 because it's too close to ESC
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Strip trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Save a file as root
noremap <leader>W :w !sudo tee % > /dev/null<cr>

" Quick editing
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" }}}

" Plugins {{{

" Bufferline {{{

" bufferline should not echo to the command line
let g:bufferline_echo = 0

" Denotes whether buffer numbers should be displayed
let g:bufferline_show_bufnr = 0

" }}}

" Airline {{{

" Set airline theme to base16
let g:airline_theme = 'base16'

" Use Powerline fonts with airline
let g:airline_powerline_fonts = 1

" Use enhanced airline tabline
let g:airline#extensions#tabline#enabled = 1

" Enable displaying buffers with a single tab
let g:airline#extensions#tabline#show_buffers = 1

" Enable displaying tab number in tabs mode
let g:airline#extensions#tabline#show_tab_nr = 1

" Disable buffer numbers in tabline
let g:airline#extensions#tabline#buffer_nr_show = 0

" Configure the formatting of filenames to just the tail
let g:airline#extensions#tabline#fnamemod = ':t'

" The `unique_tail_improved` - another algorithm, that will smartly uniquify
" buffers names with similar filename, suppressing common parts of paths
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Enable displaying index of the buffer
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Enable tagbar integration
let g:airline#extensions#tagbar#enabled = 1

" Enable bufferline integration
let g:airline#extensions#bufferline#enabled = 1

" Determine whether bufferline will overwrite customization variables
let g:airline#extensions#bufferline#overwrite_variables = 1

" }}}

" YouCompleteMe {{{

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<c-n>', '<down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<up>']

" }}}

" SuperTab {{{

let g:SuperTabDefaultCompletionType = '<c-n>'

" }}}

" UltiSnips {{{

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<c-n>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'

" }}}

" Gundo {{{

" Map F5 to toggle gundo window
nnoremap <leader>ud :GundoToggle<CR>

" Display gundo in window on right
let g:gundo_width = 50
let g:gundo_right = 1
let g:gundo_help = 0

" }}}

" Tabularize {{{

" Tabularize shortcuts for = and : alignment
if exists(":Tabularize")
  nnoremap <leader>a= :Tabularize /=<cr>
  vnoremap <leader>a= :Tabularize /=<cr>
  nnoremap <leader>a: :Tabularize /:\zs<cr>
  vnoremap <leader>a: :Tabularize /:\zs<cr>
endif

" }}}

" vim-go {{{

" vim-go run, build, test and coverage mappings
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)

" By default the mapping gd is enabled,
" which opens the target identifier in current buffer.
" Open the definition/declaration, in a new vertical,
" horizontal, or tab, for the word under your cursor:
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open
" it vertically
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <leader>gs <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <leader>gi <Plug>(go-info)

" Rename the identifier under the cursor to a new name
au FileType go nmap <leader>ge <Plug>(go-rename)

" Set golang syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = 'goimports'

" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 1

" }}}

" Syntastic {{{

" Basic syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Fix opening/saving file lag with vim-go and syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" }}}

" Command-T {{{

" Change command-t mappings
nmap <silent> <leader>ff <Plug>(CommandT)
nmap <silent> <leader>fb <Plug>(CommandTBuffer)
nmap <silent> <leader>fj <Plug>(CommandTJump)

" }}}

" NERDTree {{{

" Add NERD tree toggle mapping
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nm :NERDTreeMirror<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
nnoremap <leader>nc :NERDTreeCWD<cr>

" }}}

" Tagbar {{{

" Add Tagbar toggle mapping
nnoremap <leader>tb :TagbarToggle<cr>

" }}}

" GitGutter {{{

" Remap GitGutter hunk jumps to avoid collisions with vim-unimpaired
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" }}}

" }}}