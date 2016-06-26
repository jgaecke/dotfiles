" Jeff Gaecke
" Created on 2015-11-10

" Vim Packages in use ==========================
" Pathogen
" CtrlP
" gundu
" Nerdtree
" Airline
" tcomment_vim
" indentLine
" bufferline

" Vim Notes =================================

" Configuration and Settings ============
execute pathogen#infect()
set hidden " hides files when unsaved instead of force save
set encoding=utf-8 " utf-8 encoding is the most common the web
filetype indent on " loads filetype specific indent files /vimfiles/indent/
set tabstop=4 " number of spaces per TAB
set shiftwidth=4 " what does this do???
set softtabstop=4 " number of spaces per TAB when editing
set expandtab " tabs are spaces
set autoindent " copy idention from previous line, when starting new
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
set backspace=indent,eol,start "backspace in i-mode more natural
set undofile " creates a <FILENAME>.un file to save undo information
set visualbell " screen flashes instead of beeps
set noerrorbells " suppress errors
" set undodir=C:\vimfiles\tmp\\
" set backupdir=C:\vimfiles\tmp\\
" set directory=C:\vimfiles\tmp\\
set undodir=$HOME\vimfiles\tmp\\
set backupdir=$HOME\vimfiles\tmp\\
set directory=$HOME\vimfiles\tmp\\

" UI Configuration======================
color molokai " color settings, molokai and twilight are favs
" let g:molokai_original = 1
syntax enable " enable syntax highlighting
winpos 0 0 " start gvim window in top left corner, doesn't like negatives #s
set lines=250 columns=85 " size of initial window
set ruler " display line and column number in bottom ruler
set number " display the line number
set relativenumber " display relative to cursor not absolute
set cursorline " highlight the current line
set list listchars=tab:>\ ,trail:·,extends:»,precedes:«,eol:¬,nbsp:×
set laststatus=2 " always show status line
set showcmd " show command in bottom ruler
set showmode "show mode in bottom ruler
set showmatch " highlight matching [{()}]
if has("gui_running")
    set guifont=Consolas:h10:cDEFAULT " font and size
	set guioptions-=T " remove toolbar
endif
" highlight OverLength ctermbg=darkgreen ctermfg=white guibg=orange guifg=white
" match OverLength /\%81v.\+/ " highlight 81st character
set splitbelow
set splitright

" Key Mappings ===========================

let mapleader="\<space>"
" disable the arrow keys to force learning
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" navigation and movement
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
" Buffers and layout
nnoremap <leader>t <C-w>v<C-w>l
nnoremap <leader>n :enew<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <leader>w :bdelete<CR>
" editing and sourcing .vimrc file
nnoremap <leader>evv <C-w><C-v><C-l>:e $MYVIMRC<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>
" editing and searching
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>h :nohlsearch<CR>
map <leader>spell :setlocal spell! spelllang=en_us<CR>
" re-select pasted text
nnoremap <leader>V V`]
" re-select inserted text
nnoremap <leader>v `[v`]
" pasting behavior for different registeries
noremap <leader>p "*p
noremap <leader>P "*P
noremap <leader>y "*y
noremap <leader>yy "*yy

" Command changes =====================
command! -nargs=* Wrap setlocal wrap linebreak nolist
command! -nargs=* Nowrap setlocal wrap list

" Plugin Configurations and Mappings ======
nnoremap <leader>f :CtrlP C:\Gaecke\ Quant\ Systems\<CR>
nnoremap <leader>j :CtrlP C:\users\<CR>
" let g:ctrlp_working_path_mode = 'r'
nnoremap <C-o> :NERDTreeToggle C:\Gaecke Quant Systems\<CR>
nnoremap <leader>ig :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" nnoremap <leader>u :GundoToggle<CR>
" let g:indentLine_char = '|'

" potential settings and configurations ============

" set nocompatible " remove backward compatibility with vi
" set modelines=0 " removes security exploit with modelines
" set gdefault " global substitution instead of first occurence
" au FocusLost * :wa " save on focus lost, like when tabbing away

" The following remaps such that \v is prefext every search query (regex)
" noremap / /\v
" vnoremap / /\v

" set wrap " text wrapping, what is the difference between hard and soft wrap
" set textwidth=79 " related to word wrap
" set formatoptions=qrn1 "related to word wrap

" save session, reopen with vim -S
" nnoremap <leader>s :mksession<CR>

" set viminfo+=n$VIM/_viminfo

" set copyindent " copy previous indention on autoindenting
" set smarttab "  tabs on start of line according to shiftwidth not tabstop
" set title

" highlight trailing whitespace and whitespace after TAB
" highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" match ExtraWhitespace /\s\+$\| \+\ze\t/

" makes a single color column down the 80th column
" set colorcolumn=80 " mark the 80th column

" creates a colored block in the >81 character space
execute "set colorcolumn=" . join(range(81,335), ',')

" highlights only the 81st character not the >=81 characters
" highlight ColorColumn ctermbg=DarkCyan ctermfg=white guibg=orange guifg=white
" call matchadd('ColorColumn', '\%81v', 100)

" This block of code should highlight only the 79th character
" Currently does not work, need to delete FileType scala, java
" augroup collumnLimit
"   autocmd!
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
"   let collumnLimit = 79 " feel free to customize
"   let pattern =
"         \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
"   autocmd BufEnter,WinEnter,FileType scala,java
"         \ let w:m1=matchadd('CollumnLimit', pattern, -1)
" augroup END


" Twiddle case, use ~ to toggle through UPPER, lower, Title case

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv
