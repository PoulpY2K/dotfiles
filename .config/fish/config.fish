set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Flutter
set -gx PATH /Applications/flutter/bin $PATH

# Python
set -gx PYTHON /opt/homebrew/opt/python@3.10/bin/python3

# Discord LEU Bot
set -gx BOT_TOKEN OTg0MTc5Mjg5MTE5NDA0MDY0.GbaLVq.jizrRWDLEhjqNdoe88GIGKgjfp4td0isvr7MGM

# Discord IssacAnchorCrown BOT TOKEN
set -gx BOT_TOKEN_ISSAC OTg4ODU3NTUyMDA5ODMwNDEw.GilM9l.pv6UsEtPZCfIfSZnADfCMyCLsGDrwwTJYNtcYw

# Discord RP Timeline Bot
set -gx BOT_TOKEN_TIMELINE OTk1Mjc5NzkxMTI3Mjc3NjE5.G3z-3f.uPEvZ4_I2aRgcxlfrthFHAI8i8bCKCgF4uptJk

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
