" ======================================
"
" Jeff Gaecke
" 2015-11-10
"
" Readme
"       Installation Instructions
"           install git
"           clone to ~/dotfiles
"           install vundle as per official doc
"           make ~/.vim/tmp
"           Stow for symlinking
"           open vim, then :PluginInstall
"           source ~/.vimrc
"       Note differences in win and *nix filepaths
" Contents
"       Vundle bootstrap
"       General settings
"       UI config
"       Key mappings
"       Plugin settings
"       Vim functions
"       Old config
" Notes
"       <C-o> and <C-i> to jump back and forth, excluding hjkl
"       use marks to navigate
"       text folding
"       split right <C-w>v, split down <C-w>s
"       comment a paragraph gcap
"       {} to navigate paragraphs, () for sentences
"       use relative numbers + jk for faster scrolling
" todo
"       learn and incorporate tmux
"
" ======================================

" Vundle bootstrap
" ======================================
set nocompatible " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin($HOME/.vim/bundle/Vundle.vim)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" myplugins
Plugin 'vim-airline/vim-airline' " powerline like status line
Plugin 'vim-airline/vim-airline-themes' " themes for airline
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy search for file, buffer, recent
Plugin 'scrooloose/nerdtree' " in buffer file tree
Plugin 'tpope/vim-fugitive' " git wrapper
Plugin 'tpope/vim-commentary' " us gcc for toggling comments in a line
Plugin 'mbbill/undotree' " visual undo tree
Plugin 'airblade/vim-gitgutter' " shows git changes in sign column
" Colors
Plugin 'tyrannicaltoucan/vim-deep-space' " 256 and gui
Plugin 'w0ng/vim-hybrid' "dark and light, 256 and gui, can be transparent
Plugin 'altercation/vim-colors-solarized' " gui only, check github for 256
Plugin 'nanotech/jellybeans.vim' "can be transparent
Plugin 'sickill/vim-monokai' " ported from textmate's theme
Plugin 'tomasr/molokai' " revised version, let g:rehash256 = 1
Plugin 'sjl/badwolf' " gui
" syntastic
" vim-surround
" ack.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" General settings
" ======================================
set encoding=utf-8 " utf-8 encoding is most common the web
set hidden " hides unsaved buffer instead of quit
set nocompatible " remove backward compatibility with vi
set modelines=0 " removes security exploit with modelines
set gdefault " global substitution instead of first occurence
filetype indent on " loads filetype specific indent files /.vim/indent/
set expandtab " tabs are spaces
set tabstop=4 " number of spaces per tab
set softtabstop=4 " number of spaces that count when editing
set shiftwidth=4 " number of columns text is indenet with reindent or auto
set autoindent " copy idention from previous line, when starting new
set backspace=indent,eol,start "backspace in i-mode more natural
set history=1000 " number of lines remembered
set undolevels=1000 " number of undo's remembered
set mouse=a " enable all mouse functions
set incsearch " search as characters are entered
set ignorecase " ignores case when searching
set smartcase " with ignore on, case sensitive with upper case query
set scrolloff=3 " show minimum of 3 lines above/below searched items
set wildmode=longest,list:longest " first tab completes to common, then cycles
set ttyfast " performance boost for long lines
set lazyredraw " performance boost for lowering redraw rate
set visualbell " screen flashes instead of beeps
set noerrorbells " suppress errors
set undofile " creates a <file.un> with undo information
set undodir=$HOME/.vim/tmp// " make sure to create tmp file, // prepends dir
set backupdir=$HOME/.vim/tmp// " ~files to tmp
set directory=$HOME/.vim/tmp// " swap files to tmp
" imap <Tab> <C-P> " remap tab to most basic autocomplete function
set complete=.,b,u,] " autocomplete searches current file, buffers, tags
set completeopt=menu,preview "autocomplete window behavior

" UI config
" ======================================
colorscheme hybrid
set background=dark "necesarry for colorschemes with two versions
syntax enable " enable syntax highlighting
set ruler " display line and column number in bottom ruler
set number " display the line number
set relativenumber " display relative to cursor not absolute
set cursorline " highlight the current line
set list listchars=tab:>\ ,trail:·,extends:»,precedes:«,eol:¬,nbsp:×
set laststatus=2 " always show status line
set showcmd " always show command line
set showmode "show mode in bottom ruler
set hlsearch " highlight matches when searching
set showmatch " highlight matching [{()}]
set splitbelow " splits open on the bottom
set splitright " splits open on the right
" execute "set colorcolumn=" . join(range(81,335), ',')
set colorcolumn=81 " single grey column on column 81
if has("gui_running")
    winpos 0 0 " start gui window in top left corner, no negatives
    " set lines=250 columns=85 " size of initial window
    set guioptions-=T " remove toolbar
    set background=dark
    colorscheme solarized
    if has('gui_win32')
        set guifont=DejaVu_Sans_Mono:h11:cANSI
    else
        set guifont=DejaVu\ Sans\ Mono\ 11
    endif
endif

" Key mappings
" ======================================
let mapleader="\<space>"
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>
" inoremap <up> <nop>
" inoremap <down> <nop>
" inoremap <left> <nop>
" inoremap <right> <nop>
inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <tab> %
vnoremap <tab> %
nnoremap + g_
vnoremap + g_
inoremap + g_
" buffers
nnoremap <leader>t :enew<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap <S-k> :bnext<CR>
nnoremap <S-j> :bprevious<CR>
" editing and searching
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>sp :setlocal spell! spelllang=en_us<CR>
" re-select pasted text
nnoremap <leader>V V`]
" re-select inserted text
nnoremap <leader>v `[v`]
" X11 clipboard use
nnoremap <leader>p "*p
nnoremap <leader>P "*P
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>dd "+dd

" Plugin settings
" ======================================
nnoremap <C-n> :NERDTreeToggle <CR>
nnoremap <leader>u :UndotreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_tomorrow'
" need to install powerline for the following to work
" let g:airline_powerline_fonts = 1
" not sure what this does
" let g:airline#extensions#tabline#fnamemod = ':t'

" command! -nargs=* Wrap setlocal wrap linebreak nolist
" command! -nargs=* Nowrap setlocal wrap list

" Vim functions
" ======================================
" Twiddle Case, in Visual Mode ~ to cycle Upper, lower, Title Case
function! TwiddleCase(str)
    if a:str ==# toupper(a:str)
        let result = tolower(a:str)
    elseif a:str ==# tolower(a:str)
        let result = substitute(a:str,'\(\<\w\+\>\)','\u\1','g')
    else
        let result = toupper(a:str)
    endif
    return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" Old config
" ======================================
" au FocusLost * :wa " save on focus lost, like when tabbing away
"
" The following remaps such that \v is prefext every search query (regex)
" noremap / /\v
" vnoremap / /\v
"
" set wrap " text wrapping, difference between hard and soft?
" set textwidth=79 " related to word wrap
" set formatoptions=qrn1 "related to word wrap
"
" save session, reopen with vim -S
" nnoremap <leader>s :mksession<CR>
"
" set viminfo+=n$VIM/_viminfo
"
" set copyindent " copy previous indention on autoindenting
" set smarttab " tabs on start of line according to shiftwidth not tabstop
" set title
