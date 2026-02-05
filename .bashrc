#
# ~/.bashrc
#

# If not running interactively, don't do anything

#proxy toggle in shell archlinux
#alias sp='export http_proxy="127.0.0.1:7890";export https_proxy="127.0.0.1:7890";export socks_proxy="127.0.0.1:7891";'
#alias usp='unset http_proxy; unset https_proxy; unset socks_proxy;'

#proxy toggle in shell in archlinux in wsl
#alias sp='export https_proxy="http://${hostip}:7890";export http_proxy="http://${hostip}:7890";export all_proxy="socks5://${hostip}:7890";export ALL_PROXY="socks5://${hostip}:7890";'
#alias usp='unset https_proxy; unset http_proxy; unset all_proxy; unset ALL_PROXY;'

[[ $- != *i* ]] && return

alias rw='~/.config/river/river-wrapper'
alias v='nvim'
alias r='ranger'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias x='startx'
PS1='[\u@\h \W]\$ '

# yazi
function l() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

#setxkbmap -model pc104 -layout us -option ctrl:swapcaps
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(starship init bash)"
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi
