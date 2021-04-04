set nocompatible              " be iMproved, required
filetype off                  " required
syntax on

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'arcticicestudio/nord-vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'luochen1990/rainbow'
Plugin 'maralla/completor.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomasiser/vim-code-dark'
Plugin 'zchee/deoplete-jedi'
Plugin 'majutsushi/tagbar'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-obsession'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'preservim/nerdcommenter'
Plugin 'easymotion/vim-easymotion'


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
set relativenumber
set ruler
set tabstop=4
set shiftwidth=4
set splitbelow
set splitright
set scrolloff=10
set laststatus=2
set backspace=2
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"Config with leader
nnoremap <SPACE> <NOP>
let mapleader=" "
nmap <silent> <leader>. :vertical resize +5<CR>
nmap <silent> <leader>, :vertical resize -5<CR>
nmap <silent> <leader>= :res +5<CR>
nmap <silent> <leader>- :res -5<CR>
nmap <silent> <leader>' :vsplit<CR>
nmap <silent> <leader>_ :split<CR>

"" Easy Motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Leader>/  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> <Leader>?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> <Leader>g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

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
let g:ctrlsf_auto_preview = 1
let g:ctrlsf_search_mode = 'async'
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '30%'

" Shortcut for fuzzy search on file names
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " Only search in the working directory
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|venv|env)$'

" enable rainbow stuff
let g:rainbow_active = 1
let g:indent_guides_enable_on_vim_startup = 2
let g:indent_guides_guide_size = 0
highlight LineNr ctermfg=grey

" Insearch
set hlsearch
let g:incsearch#auto_nohlsearch = 0
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map z/  <Plug>(incsearch-forward)
map z?  <Plug>(incsearch-backward)
map zg/ <Plug>(incsearch-stay)
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> / incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> ? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> g? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

" Vim status line
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"" session manipulation
let g:sessions_dir = '~/vim-sessions'
exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"" Flake extension configuration
let g:flake8_show_in_gutter=1  " show
" to use colors defined in the colorscheme
highlight link Flake8_Error      Error
highlight link Flake8_Warning    WarningMsg
highlight link Flake8_Complexity WarningMsg
highlight link Flake8_Naming     WarningMsg
highlight link Flake8_PyFlake    WarningMsg


"" Auto execution on event.
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " open NERDTree when no file is selected at launch
autocmd BufWritePre * %s/\s\+$//e " Trim trailing white space when save.
autocmd StdinReadPre * let s:std_in=1
autocmd BufWritePost *.py call flake8#Flake8() " Call pylint on save of .py
colorscheme nord

