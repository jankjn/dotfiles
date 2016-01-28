""""""""""""""""""""""""""""""""""""""""
" *nix:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" neovim:
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
""""""""""""""""""""""""""""""""""""""""

"-------vim-plug {{{
"---------------------------------------
call plug#begin('~/.config/nvim/plugged')
" common
Plug 'tpope/vim-sensible'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'drmingdrmer/xptemplate'
Plug 'tomtom/tcomment_vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'danro/rename.vim'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'   " require the_silver_searcher
Plug 'Raimondi/delimitMate'
" eye candy
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
" development specific
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'posva/vim-vue'
" not using currently
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim'
"     let g:deoplete#enable_at_startup = 1
"     Plug 'benekastah/neomake'
"     autocmd! BufWritePost * Neomake
" endif
" Plug 'vim-auto-save'
" Plug 'scrooloose/nerdtree'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'kchmck/vim-coffee-script'
" Plug 'maksimr/vim-jsbeautify' " require npm install -g js-beautify
call plug#end()
"}}}

"-------ctrlp.vim {{{
"---------------------------------------
" let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](node_modules|target|dist|build|vendor)|(\.(swp|ico|git|svn))$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }
"}}}

"-------xptemplate {{{
"---------------------------------------
let g:xptemplate_vars="author=zach&email=z.ach@outlook.com"
"}}}

"-------vim-auto-save {{{
"---------------------------------------
" let g:auto_save = 1
" let g:auto_save_in_insert_mode = 0
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
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
"}}}

"-------vim-javascript {{{
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇐"
let g:javascript_conceal_undefined  = "¿"
" let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "#"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
set conceallevel=1
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
" set encoding=utf-8
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
set ts=2 sw=2 sts=2
autocmd FileType c setlocal ts=4 sw=4 sts=4
"}}}

"-------general {{{
"---------------------------------------
syntax on
set hidden                      " switch with buffer unsaved
set relativenumber number       " nice line number
set cursorline                  " highlight current line
set list                        " show unvisible chars
set foldlevelstart=20           " disable fold on start
set foldmethod=syntax
autocmd FileType vim setlocal foldmethod=marker         " auto fold vim config at {{{,}}}
autocmd BufNewFile,BufRead *.md set filetype=markdown   " take *.md as markdown

set mouse=
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"}}}
