set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" call plug#begin(g:plugged_home)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
Plugin 'tomasiser/vim-code-dark'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'zchee/deoplete-jedi'
Plugin 'maralla/completor.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dyng/ctrlsf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'arcticicestudio/nord-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" call plug#end()
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
set number
set ruler
set tabstop=4
set shiftwidth=4
set mouse=a
set splitbelow
set splitright
colorscheme nord

"" Remapping
" move lines up or down
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

" Control F search
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Shortcut for fuzzy search on file names
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " Only search in the working directory
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|venv|env)$'

" enable rainbow stuff
let g:rainbow_active = 1
let g:indent_guides_enable_on_vim_startup = 1
highlight LineNr ctermfg=grey

"" Auto execution on event.
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " open NERDTree when no file is selected at launch
autocmd BufWritePost *.py call flake8#Flake8() " Call pylint on save of .py
autocmd BufWritePre * %s/\s\+$//e " Trim trailing white space when save.
autocmd StdinReadPre * let s:std_in=1
