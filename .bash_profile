export PATH=$HOME/bin:$PATH
export PATH=$HOME/Library/Haskell/bin:$PATH
export PATH=$HOME/bin/qt-5.0.0-beta:$PATH
export PATH=$PATH:"/usr/local/mysql/bin"
export PATH=$HOME/.bin:$PATH

export ARDUINO_DIR=/Applications/Arduino.app/Contents/Resources/Java
export ARDMK_DIR=$HOME/IDEO/ArduinoProject/Arduino-Makefile

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local  BLACK="\[\033[0;0m\]"
  case $TERM in
    xterm*)
      TITLEBAR='\[\033]0;\u@\h:\w\007\]'
      ;;
    *)
      TITLEBAR=""
      ;;
  esac

  PS1="$GREEN\$(parse_git_branch)$BLACK\$ "
  PS2='> '
  PS4='+ '
}
proml

alias mm='middleman'
alias be='bundle exec'
alias bi='bundle install'
alias bu='bundle update'
alias ls='ls -HG'
alias ll='ls -lHG'
alias gd='git diff'
alias gds='git diff --staged'
alias gwd='git diff --color-words'
alias gwds='git diff --staged --color-words'
alias gs='git status'
alias gl='git log'
alias glo='git log --oneline'
alias gc='git commit'
alias gb='git branch -a'

alias git-show-ignored='git ls-files -v | grep ^h'

alias up='cd ..'
alias back='cd -'

bind 'set completion-ignore-case on'

source ~/.git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
