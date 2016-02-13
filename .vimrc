"envImprovement
"source /apollo/env/envImprovement/var/vimruntimehook
"source /apollo/env/envImprovement/var/vimrc

"source /apollo/env/envImprovement/dotfiles/vimrc


" Pathogen
" --------

filetype off                    " Avoid a Vim/Pathogen bug
call pathogen#helptags()
call pathogen#infect()

set nocompatible                " Don't maintain compatibility with vi
syntax on                       " Highlight known syntaxes
filetype plugin indent on

" Configuration
" -------------
set encoding=utf-8
set t_Co=256
set visualbell                  " Suppress audio/visual error bell
set ttimeout
set ttimeoutlen=50
set showcmd                     " Show typed command prefixes while waiting for operator

set number                      " Line numbers
set nowrap                      " No wrapping
set ignorecase                  " Ignore case
set smartcase                   " ... unless uppercase characters are involved

set virtualedit=onemore         " Cursor can display one character past line
set showmatch                   " Show matching brackets
set hidden                      " Allow hidden, unsaved buffers
set splitright                  " Add new windows towards the right
set splitbelow                  " ... and bottom
set wildmode=list:longest       " Bash-like tab completion
set scrolloff=3                 " Scroll when the cursor is 3 lines from edge

set laststatus=2                " Always show statusline
let g:rails_statusline=0        " Disable rails statusline, which doesn't like powerline
let g:Powerline_symbols='fancy'

set incsearch                   " Incremental search
set history=1024                " History size

set autoread                    " No prompt for file changes outside Vim

colorscheme obsidian

set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set nosmartindent
set cindent
set cinkeys-=0#
set ruler
cmap w!! w !sudo tee >/dev/null %
command W w !sudo tee % >/dev/null

set autowriteall                " Save when focus is lost
autocmd FocusLost * silent! wall

" Keybindings
" -----------

let mapleader = ";"
let maplocalleader = ","

" Make Y consistent with D and C
map Y           y$

" Indent/unindent visual mode selection
vmap <tab>      >gv
vmap <S-tab>    <gv

" Search
nmap <leader>s  :%s/
vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
map <leader>w   ^Ww
map <leader>=   ^W=
map <leader>j   ^Wj
map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Remove highlighting post-search
nmap <leader>y  :nohls<CR>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

"nerdtree settings
let g:NERDTreeMouseMode = 2 
let g:NERDTreeWinSize = 40

"vim-ruby
:let g:ruby_indent_access_modifier_style = 'indent'
:let ruby_operators = 1
:let ruby_space_errors = 1
"":let ruby_fold = 1
:let g:rubycomplete_rails = 1

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
"nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>

"undotree
nnoremap <F5> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
endif

" Tabular
nnoremap <leader>a= :Tabularize /=<CR>
vnoremap <leader>a= :Tabularize /=<CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>

" Custom maps
set pastetoggle=<leader>p


" Whitespace & highlighting & language-specific config
" ----------------------------------------------------

" Strip trailing whitespace for code files on save
" C family
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e

" Ruby, Rails
autocmd BufWritePre *.rb,*.yml,*.js,*.json,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml,*.feature :%s/\s\+$//e
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.god set filetype=ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile soloistrc set filetype=ruby

" Java, PHP
autocmd BufWritePre *.java,*.php :%s/\s\+$//e

" Highlight JSON files as javascript
autocmd BufRead,BufNewFile *.json set filetype=javascript

" Highlight Jasmine fixture files as HTML
autocmd BufRead,BufNewFile *.jasmine_fixture set filetype=html

" Consider question/exclamation marks to be part of a Vim word.
autocmd FileType ruby set iskeyword=@,48-57,_,?,!,192-255
autocmd FileType scss set iskeyword=@,48-57,_,-,?,!,192-255

" Insert ' => '
autocmd FileType ruby imap ^L <Space>=><Space>

" Disable 'ex' mode
map Q <Nop>

