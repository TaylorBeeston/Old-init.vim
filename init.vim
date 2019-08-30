
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash           " use bash, not fish or zsh
syntax on                     " enable syntax highlighting

" *** VUNDLE ***

" You should run
" git clone https://github.com/VundleVim/Vundle.vim.git
" before using this

" I am going to try and fully switch to VimPlug someday, but for now I am
" using both

" ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Build better habits, I don't really use this anymore =(
" Plugin 'takac/vim-hardtime'

" use :SCROLL to test color schemes
Plugin 'https://github.com/vim-scripts/ScrollColors'

" Show Indent Guides
Plugin 'nathanaelkane/vim-indent-guides'

" Code folding
Plugin 'pseewald/vim-anyfold'
" Try it out!
" za: toggle folds at current line
" zo: open fold
" zc: close fold
" zR: open all folds
" zM: close all folds

" Underline word under cursor
Plugin 'itchyny/vim-cursorword'

" Syntax checking/highlighting
Plugin 'scrooloose/syntastic'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'vim-python/python-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'

" HTML
Plugin 'mattn/emmet-vim'

" CSS
Plugin 'ap/vim-css-color' " Displays colors inline (#FFFFFF should appear as white)

" Ruby on Rails plugin
Plugin 'tpope/vim-rails'

" Javascript
Plugin 'maksimr/vim-jsbeautify' " use this with <c-f>

" Code snippets plugin
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'isRuslan/vim-es6'

" Toggle comments with gcc
Plugin 'tomtom/tcomment_vim'

" Work with surrounds e.g. cs"' will change double quotes to single quotes
Plugin 'tpope/vim-surround'

" Git Commands
Plugin 'tpope/vim-fugitive'
call vundle#end()

" Vim-Plug - I hope to solely use this in the future

" Make sure to run
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" prior to using
call plug#begin('~/.local/share/nvim/plugged')
" This requires running
" sudo npm -g install instant-markdown-d
" prior to use
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Good Markdown support

" Language helpers
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'} " PHP
Plug 'Shougo/neco-vim'                                             " Vimscript

" Autocompletion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2-bufword'                      " Buffer
Plug 'ncm2/ncm2-path'                         " Path
Plug 'phpactor/ncm2-phpactor'                 " PHP
Plug 'ncm2/ncm2-cssomni'                      " CSS
Plug 'ncm2/ncm2-tern', {'do': 'npm install'}  " JS
Plug 'ncm2/ncm2-jedi'                         " Python
Plug 'ncm2/ncm2-pyclang'                      " C/C++
Plug 'ncm2/ncm2-vim'                          " Vimscript
Plug 'ncm2/ncm2-html-subscope'                " Detect JS/CSS in HTML
Plug 'ncm2/ncm2-markdown-subscope'            " Detect code in Markdown

" Linting
Plug 'dense-analysis/ale'

" UI
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on " required
set encoding=utf-8        " use UTF-8 Encoding
set showcmd               " display incomplete commands


" Use space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

" Escape from terminal
:tnoremap <Esc> <C-\><C-n>

set rnu " relative line numberes

" Autocompletion
autocmd BufEnter * call ncm2#enable_for_buffer() " call ncm on every buffer
set completeopt=noinsert,menuone,noselect        " fix menu
inoremap <c-c> <ESC>                             
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
let g:ncm2_pyclang#library_path = 'usr/lib/llvm-7/lib' " Helpful for C/C++
let g:python3_host_prog = '/usr/bin/python3' " Make sure NCM knows where Python is

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set cc=80                       " show column border

"" Searching
set nohlsearch                  " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" UI Stuff
set noshowmode    " let airline show the current mode
set nolazyredraw  " don't render half of the screen

" Set colorscheme
let base16colorspace=256             " use all the colors
colorscheme base16-gruvbox-dark-hard " set colorscheme
set background=dark                  " i am the batman

" True Color Support if it's available in terminal
if has("termguicolors")
  set termguicolors
endif

" Plugin flags
let g:indent_guides_enable_on_vim_startup = 1
let g:python_highlight_all = 1
" let g:hardtime_default_on = 1

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

" Search for CTags
set tags=./tags;

" Use <c-f> for Js-Beautify
map <c-f> :call JsBeautify()<cr>

" Anyfold
autocmd Filetype * AnyFoldActivate
set foldlevel=99

" Phpactor
autocmd Filetype php setlocal omnifunc=phpactor#Complete
let g:phpactorCompletionIgnoreCase = 0
let g:phpactorOmniError = v:true

" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <Leader>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <Leader>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

""" ALE
let g:ale_linters = {'python': ['flake8'],
                    \'php': ['php_cs_fixer']}
let g:ale_fixers  = {'python': ['autopep8'],
                    \'php': ['php_cs_fixer']}
