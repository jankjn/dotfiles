# go to home on start up
if [[ -z $OLDPWD && $PWD = '/' ]]; then cd; fi
# exclude '/' from z
_Z_EXCLUDE_DIRS=('/')
# a directory jump tool, https://github.com/rupa/z
source ~/.local/bin/z.sh
# git alias from prezto
source ~/.local/git_alias
# git+hub
eval "$(hub alias -s)"

alias in='sh ~/.local/bin/portal.sh'
alias out='sh ~/.local/bin/portal.sh "out"'

alias la='ls -lAh'
alias lad='la -d .*'
alias lsd='ls -d .*'
alias e='explorer'

# sublime text
alias sub='subl -a'
# ssh to docker host
alias sshtodocker='docker-machine ssh default'
