
" Set runtime path for Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'mbbill/undotree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'TomNomNom/xoria256.vim'
Plugin 'davidhalter/jedi-vim'
call vundle#end()

" Required for Vundle
filetype plugin on 

" Highlighting and Syntax
syntax on

" Basic Settings
set encoding=utf-8
set relativenumber
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" Leader key
let mapleader = ","

" NERDTree configuration
nnoremap <C-n> :NERDTreeToggle<CR>

" History
set history=50

" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Display settings
set nowrap
set linebreak
set showbreak=▹

" Auto indent settings
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" File handling
set hidden 

" Backspace behavior
set backspace=eol,start,indent

" Indentation settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Mouse settings
set mouse=

" Colorscheme
if &t_Co == 256
    try
        color xoria256
    catch /^Vim\%((\a\+)\)\=:E185/
        " Oh well
    endtry
endif

" Tab management
nnoremap + :tabnew<CR>
nnoremap - :tabclose<CR>
map 7 gT
map 9 gt

" Split window keybindings
nnoremap <leader>sh :split<CR>
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <C-Up> :resize +5<CR>
nnoremap <C-Down> :resize -5<CR>
nnoremap <C-Right> :vertical resize +5<CR>
nnoremap <C-Left> :vertical resize -5<CR>

" UndoTree toggle
nnoremap <F5> :UndotreeToggle<CR>

" Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Open file under cursor in new tab
map <F9> <Esc><C-W>gF<CR>:tabm<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj

" Bash / Emacs keys for command line
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Custom commands
nmap <Leader>b :!echo <C-R><C-W> \| base64 -d<CR>
nmap <Leader>g :tabnew\|read !grep -Hnr '<C-R><C-W>'<CR>
nmap <Leader>s :%!sort -u --version-sort<CR>

" Visual prompt for command completion
set wildmenu

" Write current file with sudo permissions
command! W w
command! -bang Qall qall

" Folding
set nofoldenable

" Environment-specific settings
if $VIMENV == 'talk'
  set background=light
  let g:solarized_termcolors=256
  colo solarized
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
else
  " Transparent background
  hi Normal ctermbg=none
  hi NonText ctermbg=none
endif

if $VIMENV == 'prev'
  noremap <Space> :n<CR>
  noremap <Backspace> :N<CR>
  noremap <C-D> :call delete(expand('%')) <bar> argdelete % <bar> bdelete<CR>
  set noswapfile
endif

" Compatibility
set noesckeys
set nocompatible

