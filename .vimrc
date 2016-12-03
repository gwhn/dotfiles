set nocompatible              " be iMproved, required
filetype off                  " required

" Configure Plugins {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Essentials {{{

Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe' " NOTE: must come after supertab
Plugin 'majutsushi/tagbar'
Plugin 'mbbill/undotree'
Plugin 'wincent/ferret'

" }}}

" Utilities {{{

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-speeddating'
Plugin 'godlygeek/tabular'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kana/vim-textobj-user'

" }}}

" Snippets {{{

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'

" }}}

" Syntax {{{

Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'sheerun/vim-polyglot'
Plugin 'cakebaker/scss-syntax.vim'

" }}}

" Themes {{{

Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'kshenoy/vim-signature'
Plugin 'ryanoasis/vim-devicons' " NOTE: must come after NERDTree and airline

" }}}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" Options {{{

" Enable syntax highlighting
syntax on

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
set visualbell noerrorbells t_vb= belloff=all

" Disable cursor keys in insert mode
set noesckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Auto read and write
set autoread autowrite

" Don’t add empty newlines at the end of files
set binary
set noeol

" Enable more history
set history=1000

" Respect modeline in files
set modeline
set modelines=0

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers
set number

" set dark background
set background=dark

" Highlight current line
set cursorline

" Make tabs as wide as two spaces
set tabstop=2 shiftround shiftwidth=2 softtabstop=2 expandtab

" Timeout on key codes but not mappings
set notimeout ttimeout ttimeoutlen=10

" Set updatetime
set updatetime=1000

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set list

" Show breaks
set showbreak=↪

" Split new windows below and right
"set splitbelow splitright

" Don't redraw while executing macros
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
set linebreak wrap textwidth=80 formatoptions=qrn1tcj "colorcolumn=+1

" Ignore case of searches
set ignorecase smartcase

" Highlight dynamically as pattern is typed
set hlsearch incsearch showmatch gdefault

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

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
set scrolloff=3 sidescroll=1 sidescrolloff=10

" Start with fold closed and use marker folding
set foldlevelstart=0 foldmethod=marker

" Allow virtual editing in Visual block mode
set virtualedit+=block

" Backup, Swap and Undo Options {{{

" Enable backup and disable swap file
set backup noswapfile

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

" Auto save undo history
if has("persistent_undo")
  set undodir=~/.vim/undo
  set undofile
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" }}}

" }}}

" Abbreviations {{{

iabbrev guy@ guy@weblitz.co.uk
iabbrev gwhn@ guy@weblitz.co.uk

" }}}

" Auto Commands {{{

" Save on losing focus
autocmd FocusLost * :silent! wall

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  autocmd BufReadPost * set relativenumber
endif

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Only show cursorline in the current window and in normal mode.
augroup cline
    autocmd!
    autocmd WinLeave,InsertEnter * set nocursorline
    autocmd WinEnter,InsertLeave * set cursorline
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

" Place quickfix window at bottom right
autocmd FileType qf wincmd J

" Place help window at top left
autocmd FileType help wincmd K

" }}}

" Themes {{{

" Configure base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  source ~/.vimrc_background
endif

" Make cursor line number bold
set highlight=Nb

" }}}

" Leaders {{{

" Change mapleader to <space> key
let mapleader = "\<space>"
noremap \ <space>
" Change maplocalleader to <cr> key
let maplocalleader = "\<cr>"
noremap _ <cr>

" }}}

" Key Mappings {{{

" Command Mode Mappings {{{

" }}}

" Insert Mode Mappings {{{

" }}}

" Normal Mode Mappings {{{

" }}}

" Visual Mode Mappings {{{

" }}}

" Quick escaping
inoremap jk <esc>
inoremap JK <esc>

" Tame searching/moving
nnoremap / /\v
vnoremap / /\v

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

" Make j and k move up and down by screen line, not file line
nnoremap j gj
nnoremap k gk

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

" Plugins Settings {{{

" NERDTree {{{

let g:NERDTreeHijackNetrw = 1

nnoremap <leader>nt :NERDTreeToggle<cr>

" }}}

" Airline {{{

" Set airline theme to light
let g:airline_theme = 'cobalt2'

" Improves the contrast for the inactive statusline
let g:airline_base16_improved_contrast = 1

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

" }}}

" YouCompleteMe {{{

let g:ycm_autoclose_preview_window_after_insertion = 1

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<c-j>', '<c-n>', '<down>']
let g:ycm_key_list_previous_completion = ['<c-k>', '<c-p>', '<up>']

" }}}

" SuperTab {{{

let g:SuperTabDefaultCompletionType = '<c-n>'
let g:SuperTabCrMapping = 0

" }}}

" UltiSnips {{{

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" }}}

" Undotree {{{

nnoremap <leader>ud :UndotreeToggle<cr>

" }}}

" Tabularize {{{

" Tabularize shortcuts for = and : alignment
if exists(":Tabularize")
  nnoremap <leader>t= :Tabularize /=<cr>
  vnoremap <leader>t= :Tabularize /=<cr>
  nnoremap <leader>t: :Tabularize /:<cr>
  vnoremap <leader>t: :Tabularize /:<cr>
  nnoremap <leader>t:: :Tabularize /:\zs<cr>
  vnoremap <leader>t:: :Tabularize /:\zs<cr>
  nnoremap <leader>t, :Tabularize /,<cr>
  vnoremap <leader>t, :Tabularize /,<cr>
  nnoremap <leader>t<bar> :Tabularize /<bar><cr>
  vnoremap <leader>t<bar> :Tabularize /<bar><cr>
endif

" }}}

" BufExplorer {{{

let g:bufExplorerDefaultHelp = 0       " Do not show default help.

" }}}

" YankRing {{{

nnoremap <silent> <leader>yr :YRShow<CR>

" }}}

" vim-go {{{

" Set golang syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Enable goimports to automatically insert import paths instead of gofmt
let g:go_fmt_command = 'goimports'

" By default vim-go shows errors for the fmt command, to disable it
let g:go_fmt_fail_silently = 0

" Experimental mode saves undo history
let g:go_fmt_experimental = 1

" An issue with vim-go and syntastic is that the location list window that
" contains the output of commands such as :GoBuild and :GoTest might not appear
let g:go_list_type = "quickfix"

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" vim-go run, build, test and coverage mappings
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <leader>gm <Plug>(go-metalinter)
autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

" By default the mapping gd is enabled,
" which opens the target identifier in current buffer.
" Open the definition/declaration, in a new vertical,
" horizontal, or tab, for the word under your cursor:
autocmd FileType go nmap <leader>ds <Plug>(go-def-split)
autocmd FileType go nmap <leader>dv <Plug>(go-def-vertical)
autocmd FileType go nmap <leader>dt <Plug>(go-def-tab)

" Open the relevant Godoc for the word under the cursor with <leader>gd or open
" it vertically
autocmd FileType go nmap <leader>gd <Plug>(go-doc)
autocmd FileType go nmap <leader>gv <Plug>(go-doc-vertical)

autocmd FileType go nmap <leader>ge :GoDecls<cr>
autocmd FileType go nmap <leader>gi :GoDeclsDir<cr>

autocmd FileType go nmap <leader>ggs <Plug>(go-implements)
autocmd FileType go nmap <leader>ggi <Plug>(go-info)
autocmd FileType go nmap <leader>gge <Plug>(go-rename)
autocmd FileType go nmap <leader>ggt <Plug>(go-sameids-toggle)
autocmd FileType go nmap <leader>ggr <Plug>(go-referrers)
autocmd FileType go nmap <leader>ggd <Plug>(go-describe)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

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