export PATH=$HOME/bin:$PATH
export PATH=$HOME/.bin:$PATH

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
function proml {
  local      ORANGE="\[\033[1;31m\]"
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local  BLACK="\[\033[0;0m\]"
  local YELLOW="\[\033[0;33m\]"
  case $TERM in
    xterm*)
      TITLEBAR='\[\033]0;\u@\h:\w\007\]'
      ;;
    *)
      TITLEBAR=""
      ;;
  esac

  PS1="$ORANGE\W $GREEN\$(parse_git_branch)$BLACK 🍔  "
  PS2='> '
  PS4='+ '
}
proml

alias mm='bundle exec middleman'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias ls='ls -HG'
alias ll='ls -lHG'
alias gd='git diff'
alias d='git diff'
alias gds='git diff --staged'
alias gwd='git diff --color-words'
alias gwds='git diff --staged --color-words'
alias gs='git status'
alias s='git status'
alias gl='git log'
alias l='git log'
alias glo='git log --oneline --decorate'
alias gc='git commit'
alias gb='git branch'
alias g='git'

alias git-show-ignored='git ls-files -v | grep ^h'

alias up='cd ..'
alias back='cd -'
alias ..='cd ..'

alias ss='cowsay -f stegosaurus'

bind 'set completion-ignore-case on'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

stty -ixon
HISTSIZE=10000
