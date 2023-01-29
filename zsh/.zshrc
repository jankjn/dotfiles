##
##  zzz's zshrc
##

# use emacs mode
set -o emacs

# from https://github.com/mattmc3/zsh_unplugged
# declare a simple plugin-load function
function plugin-load {
  local repo plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.local/share/zsh}/plugins}
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
  reegnz/jq-zsh-plugin

  # load these at hypersonic load speeds with zsh-defer
  romkatv/zsh-defer
  MichaelAquilina/zsh-you-should-use
  hlissner/zsh-autopair
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
)
plugin-load $plugins

# source chruby
if [[ -s "${HOMEBREW_REPOSITORY:-/opt/homebrew}/opt/chruby/share/chruby/chruby.sh" ]]; then
  source "${HOMEBREW_REPOSITORY:-/opt/homebrew}/opt/chruby/share/chruby/chruby.sh"
fi

# init starship
(( $+commands[starship] )) && eval "$(starship init zsh)"

# jq-zsh-plugin key binding
bindkey "^j" jq-complete

# aliases
source ${ZDOTDIR:-$HOME/.local/share/zsh}/alias.sh
