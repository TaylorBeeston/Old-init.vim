set nocompatible              " be iMproved, required
filetype off                  " required
set shell=/bin/bash           " use bash, not fish or zsh
syntax on                     " enable syntax highlighting

" *** Vim-Plug  ***

" Make sure to run
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" prior to using
"
call plug#begin('~/.local/share/nvim/plugged')
" Fuzzy searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" This requires running
" sudo npm -g install instant-markdown-d
" prior to use
Plug 'suan/vim-instant-markdown', {'for': 'markdown'} " Good Markdown support

" Language helpers
Plug 'Shougo/neco-vim'                                             " Vimscript

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'roxma/nvim-yarp'

" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}         " JSON
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}     " JS/TS
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}         " HTML
" Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}          " CSS
" Plug 'neoclide/coc-phpls', {'do': 'yarn install --frozen-lockfile'}        " PHP
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}         " Java
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}   " Ruby
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}         " YAML
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}       " Python
" Plug 'neoclide/coc-omnisharp', {'do': 'yarn install --frozen-lockfile'}    " C#
" Plug 'neoclide/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'} " Markdown

Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}

" To use this, first do :CocConfig
" Then add "coc.preferences.formatOnSaveFiletypes": ["css", "Markdown", "javascript"]
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}

Plug 'tpope/vim-dispatch'
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" Linting
Plug 'dense-analysis/ale'

" Documentation
Plug 'kkoomen/vim-doge'

" UI
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'

" Build better habits, I don't really use this anymore =(
" Plug 'takac/vim-hardtime'

" use :SCROLL to test color schemes
Plug 'https://github.com/vim-scripts/ScrollColors'

" Show Indent Guides
Plug 'nathanaelkane/vim-indent-guides'

" Code folding
Plug 'pseewald/vim-anyfold'
" Try it out!
" za: toggle folds at current line
" zo: open fold
" zc: close fold
" zR: open all folds
" zM: close all folds

" Close things like { and [
Plug 'jiangmiao/auto-pairs'

" Underline word under cursor
Plug 'itchyny/vim-cursorword'

" Syntax checking/highlighting
Plug 'scrooloose/syntastic'
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-python/python-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'briancollins/vim-jst'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }


" HTML
Plug 'mattn/emmet-vim'

" CSS
Plug 'ap/vim-css-color' " Displays colors inline (#FFFFFF should appear as white)

" Ruby on Rails plugin
Plug 'tpope/vim-rails'

" Code snippets plugin
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'
" Plug 'honza/vim-snippets'
Plug 'isRuslan/vim-es6'
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'SirVer/ultisnips'

" Smooth scrolling with <C u> and <C d>
Plug 'psliwka/vim-smoothie'

" Toggle comments with gcc
Plug 'tomtom/tcomment_vim'

" Work with surrounds e.g. cs"' will change double quotes to single quotes
Plug 'tpope/vim-surround'

" Git Commands
Plug 'tpope/vim-fugitive'

" Repeat more than just native commands
Plug 'tpope/vim-repeat'
call plug#end()

filetype plugin indent on " required
set encoding=utf-8        " use UTF-8 Encoding
set showcmd               " display incomplete commands
set scrolloff=999         " keep the cursor in the middle of the screen


" Use space as leader key
nnoremap <Space> <Nop>
let mapleader="\<Space>"

" Open current file with Chrome with <Leader>h
nnoremap <leader>h :exe ':silent !google-chrome %'<CR>

" FZF
nnoremap <leader>ef :Files<CR>
nnoremap <leader>eg :GFiles --exclude-standard --others --cached<CR>
nnoremap <leader>rg :Rg<CR>

" Escape from terminal
:tnoremap <Esc> <C-\><C-n>

set rnu " relative line numberes

" Autoformatting
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Coc Snippets

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Coc Jest
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
nnoremap <leader>te :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

let g:OmniSharp_server_stdio = 1

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode
set cc=80,100                   " show column border

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
let g:vim_jsx_pretty_colorful_config = 1
let g:LanguageClient_serverCommands = {
  \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
  \ }

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''

" Search for CTags
set tags=./tags;

" Anyfold
autocmd Filetype * AnyFoldActivate
set foldlevel=99

""" ALE
let g:ale_linters = {'python': ['flake8'],
                    \'php': ['php_cs_fixer'],
                    \'cs': ['OmniSharp']}
let g:ale_fixers  = {'python': ['autopep8'],
                    \'php': ['php_cs_fixer']}
