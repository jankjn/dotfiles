"" vim: set foldlevel=20 foldmethod=marker:
""""""""""""""""""""""""""""""""""""""""
" NEOVIM config
""""""""""""""""""""""""""""""""""""""""

"-------vim-plug {{{
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"---------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
" common
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'danro/rename.vim', { 'on': 'Rename' }
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'junegunn/vim-easy-align', { 'on': 'EasyAlign' }
Plug 'w0rp/ale'
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }
Plug 'drmingdrmer/xptemplate'
Plug 'rizzatti/dash.vim', { 'on': 'Dash' }
" eye candy
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
" dev specific
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/html5.vim', { 'for': ['html', 'eruby', 'vue'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'eruby', 'vue', 'scss'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'vue'] }
Plug 'posva/vim-vue', { 'for': 'vue' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'nginx.vim'
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
call plug#end()
"}}}

"-------clear autocmds {{{
"---------------------------------------
augroup vimrc
  autocmd!
augroup END
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
au vimrc FileType html,eruby,vue EmmetInstall
au vimrc FileType css,scss EmmetInstall
"}}}

"-------ale {{{
"---------------------------------------
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = 'Δ'
let g:ale_echo_msg_format = '|%linter%| %s'
let g:ale_linter_aliases = { 'vue': 'javascript' }
let g:ale_javascript_eslint_options = '--ext js,vue'
hi link ALEErrorSign GruvboxRedSign
hi link ALEWarningSign GruvboxYellowSign
"}}}

"-------airline {{{
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
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "#"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"
let g:javascript_plugin_jsdoc = 1
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

"-------ex mode alias {{{
"---------------------------------------
" sudo save
cnoremap w!! w !sudo tee > /dev/null %
" current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
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
au vimrc BufWritePost $MYVIMRC source <afile> | AirlineRefresh
"}}}

"-------tab config {{{
"---------------------------------------
set expandtab
set ts=2 sw=2 sts=2
au vimrc FileType c setlocal ts=4 sw=4 sts=4
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
au vimrc BufNewFile,BufRead *.md set filetype=markdown " take *.md as markdown
" autocmd BufNewFile,BufRead *.vue set filetype=html   " take *.vue as html
au vimrc BufNewFile,BufRead *.css set filetype=scss    " take *.css as scss (for postcss)

set inccommand=nosplit          " show command effect on typing(nvim 0.1.7)
set mouse=                      " disable mouse
set clipboard+=unnamedplus      " use system clipboard
set termguicolors               " enable true color
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1                     " automatic cursor shape
"}}}
