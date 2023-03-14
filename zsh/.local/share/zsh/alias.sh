# vim:fileencoding=utf-8:foldmethod=marker

# Define general aliases.
alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias mkdir="${aliases[mkdir]:-mkdir} -p"
alias o='open'
alias pbc='pbcopy'
alias pbp='pbpaste'

# Safe ops. Ask the user before doing anything destructive.
alias rm="${aliases[rm]:-rm} -i"
alias mv="${aliases[mv]:-mv} -i"
alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"

# File Download
if (( $+commands[curl] )); then
  alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif (( $+commands[wget] )); then
  alias get='wget --continue --progress=bar --timestamping'
fi

# Resource Usage
alias df='df -kh'
alias du='du -kh'

source $(dirname $0)/git-alias.sh

# Commands
(( $+commands[hub] )) && alias git=hub
(( $+commands[bat] )) && alias cat=bat
(( $+commands[kitty] )) && alias kssh="kitty +kitten ssh"
(( $+commands[kubectl] )) && alias k=kubectl
