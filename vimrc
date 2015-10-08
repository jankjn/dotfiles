""""""""""""""""""""""""""""""""""""""""
"
"  Powered by Vundle.vim
"
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
""""""""""""""""""""""""""""""""""""""""

"-------Vundle.vim {{{
"---------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" common
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'msanders/snipmate.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-auto-save'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'rking/ag.vim'
Plugin 'paredit.vim'
" eye candy
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
" development specific
Plugin 'mattn/emmet-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'maksimr/vim-jsbeautify' " require npm install -g js-beautify

call vundle#end()               " required
filetype plugin indent on       " required
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

"-------vim-airline {{{
"---------------------------------------
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" use solarized
let g:airline_theme='solarized'
let g:airline_powerline_fonts=1
"}}}

"-------solarized {{{
"---------------------------------------
colorscheme solarized
set background=dark
"}}}

"-------vim-jsbeautify {{{
"---------------------------------------
" for js
autocmd FileType javascript noremap <buffer> <c-h> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-h> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-h> :call CSSBeautify()<cr>
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
"}}}
