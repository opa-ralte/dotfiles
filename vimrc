" ============================================================
"  .vimrc — minimal config for C development
" ============================================================


" --- Basics -------------------------------------------------
set nocompatible               " disable Vi compatibility
filetype plugin indent on      " enable filetype detection
syntax on                      " syntax highlighting


" --- Appearance ---------------------------------------------
set number                     " absolute line numbers
set relativenumber             " relative line numbers (great for motions)
set cursorline                 " highlight current line
set colorcolumn=80             " column guide at 80 chars
set scrolloff=8                " keep 8 lines above/below cursor
set laststatus=2               " always show status line
set showcmd                    " show partial commands in status
set showmatch                  " highlight matching brackets
set wildmenu                   " enhanced command-line completion


" --- Indentation (C style) ----------------------------------
set tabstop=4                  " tab = 4 spaces visually
set shiftwidth=4               " indent step = 4 spaces
set expandtab                  " use spaces instead of tabs
set autoindent                 " copy indent from previous line
set smartindent                " smart indent for C-like files
set cinoptions=:0,l1,g0,N-s   " fine-tune C brace/label indent


" --- Search -------------------------------------------------
set incsearch                  " search as you type
set hlsearch                   " highlight all matches
set ignorecase                 " case-insensitive search ...
set smartcase                  "   ... unless you type a capital


" --- Behaviour ----------------------------------------------
set hidden                     " allow unsaved buffers in background
set backspace=indent,eol,start " sane backspace
set splitbelow splitright      " more natural split placement
set noerrorbells               " no bell on errors
set noswapfile                 " no .swp files
set nobackup                   " no ~ backup files
set undofile                   " persistent undo
set undodir=~/.vim/undodir     " undo directory (create it if needed)
set updatetime=300             " faster diagnostics / CursorHold


" --- Key mappings -------------------------------------------
let mapleader = " "

" clear search highlight
nnoremap <leader>h :nohlsearch<CR>

" quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" move between splits with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" build with make (uses current Makefile)
nnoremap <leader>m :make<CR>

" open quickfix list after make errors
nnoremap <leader>e :copen<CR>
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprev<CR>


" --- C-specific tweaks --------------------------------------
augroup c_style
    autocmd!
    " treat .h files as C (not C++)
    autocmd BufRead,BufNewFile *.h set filetype=c
    " open folds by default
    autocmd FileType c setlocal foldmethod=syntax foldlevelstart=99
augroup END


" --- Netrw (built-in file browser) --------------------------
let g:netrw_banner    = 0      " hide the banner
let g:netrw_liststyle = 3      " tree view
let g:netrw_winsize   = 25     " 25% width when split

nnoremap <leader>t :Lexplore<CR>


" ============================================================
" Quick-start notes:
"   mkdir -p ~/.vim/undodir       ← required for persistent undo
"   :make                         ← build via Makefile
"   <leader>e/n/p                 ← navigate build errors
"   <leader>t                     ← toggle file tree
" ============================================================
