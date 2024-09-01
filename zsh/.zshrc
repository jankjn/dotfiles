##
##  zzz's zshrc
##

# use emacs mode
set -o emacs

# from https://github.com/mattmc3/zsh_unplugged
# declare a simple plugin-load function
function plugin-load {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDATADIR:-$HOME/.local/share/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      local -a initfiles=($plugdir/*.plugin.{z,}sh(N) $plugdir/*.{z,}sh{-theme,}(N))
      (( $#initfiles )) || { echo >&2 "No init file found '$repo'." && continue }
      ln -sf "${initfiles[1]}" "$initfile"
    fi
    fpath+=$plugdir
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

# make a github repo plugins list
plugins=(
  rupa/z
  wintermi/zsh-brew
  wintermi/zsh-lsd
  zap-zsh/fzf
  zsh-users/zsh-completions

  # load these at hypersonic load speeds with zsh-defer
  romkatv/zsh-defer
  MichaelAquilina/zsh-you-should-use
  hlissner/zsh-autopair
  zsh-users/zsh-autosuggestions
  zdharma-continuum/fast-syntax-highlighting
  mgryszko/jvm
)
plugin-load $plugins

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# aliases
source ${ZDATADIR:-$HOME/.local/share/zsh}/alias.zsh

# completion
source ${ZDATADIR:-$HOME/.local/share/zsh}/completion.zsh

# history
export HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"  # The path to the history file.
export HISTSIZE=10000                   # The maximum number of events to save in the internal history.
export SAVEHIST=10000                   # The maximum number of events to save in the history file.
# hist options
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
# Lists the ten most used commands.
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# init starship
(( $+commands[starship] )) && eval "$(starship init zsh)"

# source chruby
if [[ -s "${HOMEBREW_REPOSITORY:-/opt/homebrew}/opt/chruby/share/chruby/chruby.sh" ]]; then
  source "${HOMEBREW_REPOSITORY:-/opt/homebrew}/opt/chruby/share/chruby/chruby.sh"
  chruby ruby
fi
 
# source cargo
if [[ -s "$HOME/.cargo/env" ]]; then
  source "$HOME/.cargo/env"
fi
