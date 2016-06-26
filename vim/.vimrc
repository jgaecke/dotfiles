" ======================================
"
" Jeff Gaecke
" First created on 2015-11-10
"
" Readme
"       Installation
"           install git
"           vundle as per official documentation
"           GNU stow for symlinking
"           open vim, then :PluginInstall
" Contents
"       Vundle bootstrap
"       General settings
"       UI config
"       Key mappings
"       Plugin settings
"       Vim scripts
"       Old config
"
" Vim related notes
"      -pay special attention to difference in filepaths between
"       windows and *nix
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
Plugin 'scrooloose/nerdtree' " in buffer filetree
Plugin 'tyrannicaltoucan/vim-deep-space' " color
Plugin 'rakr/vim-one' "color, not term compatible

" CtrlP
" Airline
" bufferline
" fugitive

" gundu
" tcomment_vim
" indentLine

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
set hidden " hides unsaved buffer instead of quit
set encoding=utf-8 " utf-8 encoding is most common the web
filetype indent on " loads filetype specific indent files /.vim/indent/
set tabstop=4 " number of spaces per Tab
set shiftwidth=4 " what does this do???
set softtabstop=4 " number of spaces per Tab when editing
set expandtab " tabs are spaces
set autoindent " copy idention from previous line, when starting new
set backspace=indent,eol,start "backspace in i-mode more natural
set history=1000 " number of lines remembered
set undolevels=1000 " number of undo's remembered
set mouse=a " enable all mouse functions
set incsearch " search as characters are entered
set ignorecase " ignores case when searching
set smartcase " with ignore on, case sensitive with upper case query
set hlsearch " highlight matches
set scrolloff=3 " show minimum of 3 lines above/below searched items
set wildmenu "better tab completion in command mode
" set wildmode=list:longest " first tab completes to common, then cycles
set ttyfast " performance boost for long lines
set lazyredraw " performance boost for lowering redraw rate
set visualbell " screen flashes instead of beeps
set noerrorbells " suppress errors
set undofile " creates a <FILENAME>.un file to save undo information
set undodir=$HOME/.vim/tmp// " make sure to create tmp file, // prepends name
set backupdir=$HOME/.vim/tmp// " ~files to tmp
set directory=$HOME/.vim/tmp// " swap files to tmp

" UI config
" ======================================
colorscheme deep-space
syntax enable " enable syntax highlighting
winpos 0 0 " start gvim window in top left corner, doesn't like negatives #s
set ruler " display line and column number in bottom ruler
set number " display the line number
set relativenumber " display relative to cursor not absolute
set cursorline " highlight the current line
set list listchars=tab:>\ ,trail:·,extends:»,precedes:«,eol:¬,nbsp:×
set laststatus=2 " always show status line
set showcmd " always show command line
set showmode "show mode in bottom ruler
set showmatch " highlight matching [{()}]
if has("gui_running")
    set guifont=Consolas:h10:cDEFAULT " font for gvim
    set guioptions-=T " remove toolbar
    set lines=250 columns=85 " size of initial window
endif
set splitbelow " new splits open on the bottom
set splitright " new splits open on the right
execute "set colorcolumn=" . join(range(81,335), ',')

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
" open split right
nnoremap <leader>t <C-w>v<C-w>l
" open new buffer
nnoremap <leader>n :enew<CR>
" move to next buffer
nnoremap <S-k> :bnext<CR>
" move to previous buffer
nnoremap <S-j> :bprevious<CR>
" delete current buffer, does not work with splits
nnoremap <leader>w :bdelete<CR>
" nnoremap <leader>evv <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
" editing and searching
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>h :nohlsearch<CR>
map <leader>sp :setlocal spell! spelllang=en_us<CR>
" re-select pasted text
nnoremap <leader>V V`]
" re-select inserted text
nnoremap <leader>v `[v`]
" X11 clipboard use
noremap <leader>p "*p
noremap <leader>P "*P
noremap <leader>y "+y
noremap <leader>yy "+yy
noremap <leader>dd "+dd

" Plugin settings
" ======================================
nnoremap <C-o> :NERDTreeToggle ~\<CR>

" command! -nargs=* Wrap setlocal wrap linebreak nolist
" command! -nargs=* Nowrap setlocal wrap list

" nnoremap <leader>f :CtrlP C:\Gaecke\ Quant\ Systems\<CR>
" nnoremap <leader>j :CtrlP C:\users\<CR>
" let g:ctrlp_working_path_mode = 'r'

" nnoremap <leader>ig :IndentLinesToggle<CR>
" let g:indentLine_enabled = 0
" let g:indentLine_char = '|'
" let g:bufferline_echo = 0

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

" nnoremap <leader>u :GundoToggle<CR>

" Vim scripts
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
" set nocompatible " remove backward compatibility with vi
" set modelines=0 " removes security exploit with modelines
" set gdefault " global substitution instead of first occurence
" au FocusLost * :wa " save on focus lost, like when tabbing away
"
" The following remaps such that \v is prefext every search query
" (regex)
" noremap / /\v
" vnoremap / /\v
"
" set wrap " text wrapping, what is the difference between hard and
" soft wrap
" set textwidth=79 " related to word wrap
" set formatoptions=qrn1 "related to word wrap
"
" save session, reopen with vim -S
" nnoremap <leader>s :mksession<CR>
"
" set viminfo+=n$VIM/_viminfo
"
" set copyindent " copy previous indention on autoindenting
" set smarttab "  tabs on start of line according to shiftwidth not
" tabstop
" set title
"
" highlight OverLength ctermbg=darkgreen ctermfg=white guibg=orange guifg=white
" match OverLength /\%81v.\+/ " highlight 81st character
"
" Trailing whitespaces and whitespace after TAB are highlight
" highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" match ExtraWhitespace /\s\+$\| \+\ze\t/
"
" set colorcolumn=81 " single grey column on column 81
"
" highlights only the 81st character not the >=81 characters
" highlight ColorColumn ctermbg=DarkCyan ctermfg=white guibg=orange guifg=white
" call matchadd('ColorColumn', '\%81v', 100)
