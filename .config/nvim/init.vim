""""""""""""""""""""""""""""""""""""""""
"
"
""""""""""""""""""""""""""""""""""""""""

"-------vim-plug {{{
"---------------------------------------
call plug#begin('~/.config/nvim/plugged')
" common
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'msanders/snipmate.vim'
Plug 'tomtom/tcomment_vim'
Plug 'vim-auto-save'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'rking/ag.vim'   " require the_silver_searcher
Plug 'paredit.vim'
Plug 'scrooloose/nerdtree'
" eye candy
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
" development specific
Plug 'mattn/emmet-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'maksimr/vim-jsbeautify' " require npm install -g js-beautify
call plug#end()
"}}}

"-------ctrlp.vim {{{
"---------------------------------------
" let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }
"}}}

"-------vim-auto-save {{{
"---------------------------------------
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
" let g:auto_save_no_updatetime = 1
"}}}

"-------emmet-vim {{{
"---------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby,php EmmetInstall
"}}}

"-------status line {{{
"---------------------------------------
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" use solarized
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
"}}}

"-------colorscheme {{{
"---------------------------------------
colorscheme gruvbox
set background=dark
"}}}

"-------buffer switching {{{
"---------------------------------------
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
"}}}

"-------encoding && line ending {{{
"---------------------------------------
set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"}}}

"-------vimrc editing {{{
"---------------------------------------
nnoremap ,e :e $MYVIMRC<CR>
" When vimrc is edited, reload it
autocmd! BufWritePost $MYVIMRC source $MYVIMRC | AirlineRefresh
"}}}

"-------tab config {{{
"---------------------------------------
set expandtab
set ts=4 sw=4 sts=4
autocmd FileType ruby,yaml setlocal ts=2 sw=2 sts=2
"}}}

"-------general {{{
"---------------------------------------
syntax on
set hidden                      " switch with buffer unsaved
set relativenumber number       " nice line number
set cursorline                  " highlight current line
set foldmethod=marker           " auto fold at {{{,}}}
set list                        " show unvisible chars
autocmd BufNewFile,BufRead *.md set filetype=markdown   " take *.md as markdown

set mouse=
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"}}}
