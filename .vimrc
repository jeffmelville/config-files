" vim-sublime - A minimal Sublime Text -like vim experience bundle
"               http://github.com/grigio/vim-sublime

" NB: You need a terminal with 256 colors support

set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
filetype plugin indent on     " required!

"
" vim-sublime basic bundles here:
"
Bundle 'L9'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'gcmt/breeze.vim'
Bundle 'bling/vim-airline'
"Bundle 'Raimondi/delimitMate'

"Bundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'doc':  '\v.*docs[/\]',
  \ 'file': '\v\.(exe|so|dll|html|o)$',
  \ }

" Color Themes
Bundle 'flazz/vim-colorschemes'

" Linters
Bundle 'scrooloose/syntastic'

" Project-ish stuff
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'

" Saved snippets.
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
" something stupid about win32 path delimiters
let g:snippets_dir="$HOME/.vim/snippets"

" Projects
Bundle 'amiorin/vim-project'
let g:project_use_nerdtree = 1
call project#rc()
if filereadable($HOME . "/.vimrc_projects")
    source $HOME/.vimrc_projects
endif

" My settings
" Enable mouse actions from the GUI
set mouse=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif
set t_Co=256 " Force 256 color terminal.

colorscheme Monokai

set nopaste " Paste conflicts with snipmate
set pastetoggle=<F2>
syntax on

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
"set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
"set ignorecase                  " Search case insensitive...
"set smartcase                   " ... but not when search pattern contains upper case characters

set switchbuf=usetab,newtab     " open new buffers always in new tabs

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list
set colorcolumn=81                " 81 character color column
set guifont=Inconsolata\ Medium\ 12

"
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
" map <C-f> /
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
" vmap <Tab> >
" vmap <S-Tab> <
" comment / decomment & normal comment behavior
" vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
"vmap <C-w> S
" Cut, Paste, Copy
"vmap <C-x> d
"vmap <C-v> p
"vmap <C-c> y
" Undo, Redo (broken)
"nnoremap <C-z>  :undo<CR>
"inoremap <C-z>  <Esc>:undo<CR>
"nnoremap <C-y>  :redo<CR>
"inoremap <C-y>  <Esc>:redo<CR>
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
"nnoremap <C-b>  :tabprevious<CR>
"inoremap <C-b>  <Esc>:tabprevious<CR>i
"nnoremap <C-n>  :tabnext<CR>
"inoremap <C-n>  <Esc>:tabnext<CR>i
"nnoremap <C-t>  :tabnew<CR>
"inoremap <C-t>  <Esc>:tabnew<CR>i
"nnoremap <C-k>  :tabclose<CR>
"inoremap <C-k>  <Esc>:tabclose<CR>i
"
" Your overrides
"
if isdirectory(expand("$HOME/vimfiles/"))
  source $HOME/vimfiles/packages.vim
  source $HOME/vimfiles/shortcuts.vim
endif

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_config_file = '.syntastic_c_config'
