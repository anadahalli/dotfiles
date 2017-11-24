" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

" change the leader to be a comma
let mapleader=','

" colorscheme
colorscheme znake

" syntax highlighing
syntax on

" try to detect filetypes
filetype on

" enable loading indent file for filetype
filetype plugin indent on

" display line numbers
set number
" we are using dark background in vim
set background=dark
" show title in console title bar
set title
" menu completion in command mode on <tab>
set wildmenu
" <tab> cycles between all matching choices.
set wildmode=full
" ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc

" have a line indicate the cursor location
" set cursorline
" Keep 3 context lines above and below the cursor
set scrolloff=3
" Allow backspacing over autoindent, EOL, and BOL
set backspace=2
" Briefly jump to a paren once it's balanced
" set noshowmatch
" Wrap text
set wrap
" lines are automatically wrapped after 80 columns
set textwidth=80
" don't wrap text in the middle of a word
set linebreak
" always set autoindenting on
set autoindent
" use smart indent if there is no indent file
set smartindent
" <tab> inserts 4 spaces
set tabstop=4
" And an indent level is 4 spaces wide.
set shiftwidth=4
" <backspace> over an autoindent deletes all spaces.
set softtabstop=4
" Use spaces, not tabs, for autoindent/tab key.
set expandtab
" rounds indent to a multiple of shiftwidth
set shiftround
" Setting text and comment formatting to auto
set formatoptions=tcroql
" turn off folding
" set nofoldenable
" highlight column 80 (where words will wrap)
" set colorcolumn=80

" Don't bother me about changed buffers
set autowriteall
" Don't automatically re-read changed files.
set noautoread
" Allow vim options to be embedded in files;
set modeline
" they must be within the first or last 5 lines.
set modelines=5

" Disable all bells. I hate ringing/flashing.
set vb t_vb=
" Show incomplete normal mode commands as I type.
set showcmd
" : commands always print changed line count.
set report=0
" Use [+]/[RO]/[w] for modified/readonly/written.
set shortmess+=a
" Show some info, even without statuslines.
set ruler
" Always show statusline, even if only 1 window.
set laststatus=2

" Default to using case insensitive searches,
set ignorecase
" unless uppercase letters are used in the regex.
set smartcase
" Highlight searches by default.
set hlsearch
" Incrementally search while typing a /regex
set incsearch

" terminal color 256
set t_Co=256
" fix delay leaving insert mode
set ttimeoutlen=10
" dont show modes
set noshowmode
" faster update time
set updatetime=250

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'
let g:airline_skip_empty_sections = 1
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%2v'])
let g:airline_mode_map = {'n': 'N', 'i': 'I', 'c': 'C', 'v': 'V', 'V': 'V'}

" highlight colors
highlight VertSplit cterm=none ctermbg=none
highlight LineNr term=none ctermfg=darkgrey
highlight Search cterm=none ctermfg=black ctermbg=green
highlight Visual cterm=none ctermfg=black ctermbg=darkgrey
highlight Pmenu ctermfg=black ctermbg=darkgrey
highlight PmenuSel ctermfg=black ctermbg=green
highlight StatusLine cterm=none ctermfg=white ctermbg=235
highlight WildMenu cterm=none ctermfg=green ctermbg=235
highlight CursorLine cterm=bold ctermfg=green ctermbg=black
highlight CursorLineNr cterm=bold ctermfg=green
highlight MatchParen cterm=none ctermbg=black

" undo files
if exists('+undofile')
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=~/.vim/undo//
  set undofile
endif

" filetype indentaions
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" fugitive
map <leader>gs :Gstatus<CR>
map <leader>gd :Gdiff<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>

" nerdtree
let g:NERDTreeWinPos = 'right'
map <leader>f :NERDTreeToggle<CR>

" gundo
let g:gundo_right = 1
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
map <leader>g :GundoToggle<CR>

" git gutter
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
map <leader>a :GitGutterToggle<CR>

" Reload Vimrc
map <silent> <leader>r :source ~/.vimrc<CR>:echo 'vimrc reloaded'<CR>

" set working directory
map <leader>. :lcd %:p:h<CR>

" map jj to <esc> in insert mode
imap jj <ESC>

" use <ctrl> hjkl to move between buffers
map <c-j> :bp <CR>
map <c-k> :bn <CR>
map <c-h> :bfirst <CR>
map <c-l> :blast <CR>

" close buffer
map <leader>d :bd <CR>

" use <leader>hjkl to move between splits
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" clipboard copy and paste
map <leader>p "+p
map <leader>y "+y
map <leader>x "+x

" paste mode
map <leader>pp :setlocal paste!<cr>
imap <leader>pp :setlocal paste!<cr>

" save buffer
map <leader>w :w<CR>
imap <leader>w <C-c>:w<cr>

" quit window
map <leader>q :q<CR>

" save and quit
map <leader>wq :wq<CR>
imap <leader>wq <C-c>:wq<cr>

" spell check toggle
map <leader>s :setlocal spell!<cr>

" hide matches on <leader>space
map <leader>z :nohlsearch<cr>

" remove trailing whitespace on <leader>S
map <leader>x :%s/\s\+$//<cr>

" Automatically add breakpoint for PDB
map <leader>b Oimport pdb; pdb.set_trace()
