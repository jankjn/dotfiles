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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'   " require the_silver_searcher
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" eye candy
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons' " require nerd patched font
" development specific
Plug 'othree/html5.vim'
Plug 'jankjn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'vue'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'neomake/neomake'
" Plug 'benjie/neomake-local-eslint.vim', { 'for': ['javascript', 'html'] }
Plug 'elixir-lang/vim-elixir'
call plug#end()
"}}}


"-------ctrlp.vim {{{
"---------------------------------------
" let g:ctrlp_by_filename = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,tags

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](bower_components|node_modules|target|dist|build|vendor)|(\.(swp|ico|git|svn))$',
            \ 'file': '\v\.(log|jpg|png|jpeg)$',
            \ }
"}}}

"-------xptemplate {{{
"---------------------------------------
let g:xptemplate_vars="author=Jankin&email=jankin.z@outlook.com"
"}}}

"-------delimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
"}}}

"-------undo tree {{{
nnoremap <F1> :UndotreeToggle<cr>
let g:undotree_SetFocusWhenToggle = 1
"}}}

"-------emmet-vim {{{
"---------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
"}}}

"-------airline {{{
"---------------------------------------
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
"}}}

"-------vim-javascript {{{
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇐"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "#"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_plugin_jsdoc = 1
set conceallevel=1
"}}}

"-------neomake {{{
"---------------------------------------
let g:neomake_javascript_enabled_makers = ['eslint']
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

"-------sudo save {{{
"---------------------------------------
cnoremap w!! w !sudo tee > /dev/null %
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
nnoremap <Leader>e :e $MYVIMRC<CR>
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
set nohlsearch
set hidden                      " switch with buffer unsaved
set relativenumber number       " nice line number
set cursorline                  " highlight current line
set list                        " show unvisible chars
set listchars+=eol:¬,trail:·    " add newline char
set foldlevelstart=20           " disable fold on start
set foldmethod=syntax
autocmd FileType vim setlocal foldmethod=marker         " auto fold vim config at {{{,}}}
autocmd BufNewFile,BufRead *.md set filetype=markdown   " take *.md as markdown
autocmd BufNewFile,BufRead *.vue set filetype=html      " take *.vue as html

set mouse=
set clipboard+=unnamedplus
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"}}}
