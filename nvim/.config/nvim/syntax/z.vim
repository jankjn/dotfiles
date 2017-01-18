if exists("b:current_syntax")
  finish
endif

" runtime! syntax/sass.vim
" runtime! syntax/html.vim
" syntax include @sass syntax/sass.vim
" syntax region sass keepend start=/<style\( \+scoped\)\? lang=\("\|'\)[^\1]*sass[^\1]*\1\( \+scoped\)\?>/ end="</style>" contains=@sass fold
" syntax include @JS syntax/javascript.vim
" syntax region javascript keepend matchgroup=Function start=/<script\( lang="babel"\)\?\( type="text\/babel"\)\?>/ end="</script>" contains=@JS fold
syn region String start=/"/ end=/"/ skip=/\\./

let b:current_syntax = "szss"

" vim:set sw=2:
