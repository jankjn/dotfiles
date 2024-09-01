#
# Executes commands at login post-zshrc.
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Execute code only if STDERR is bound to a TTY.
if [[ -o INTERACTIVE && -t 2 ]]; then


  # Print system info
  if (( $+commands[fastfetch] )); then
    fastfetch -l small -s Title:Separator:OS:Host:Kernel:Uptime:Shell:DE:WM:CPU:Battery:PowerAdapter
  # Print a random, hopefully interesting, adage.
  elif (( $+commands[fortune] )); then
    fortune -s
    print
  fi

fi >&2
