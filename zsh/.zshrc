# ZSH CONFIG

# Path to your oh-my-zsh installation.
export ZSH=/home/simon/.oh-my-zsh

# Set zsh theme
ZSH_THEME="miloshadzic"

# Use hyphen-insensitive completion, _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=4

# Set command execution time stamp for history command.
HIST_STAMPS="dd/mm/yyyy"

# Load plugins
plugins=(git sudo)



# USER CONFIGURATION
export PATH="/home/simon/.dotfiles/bin:/usr/bin:/usr/bin/core_perl"


source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
export BROWSER='crm'
# export LANG='en-gb'



# ALIASES

# basics
alias c='clear'
alias cl='clear && ls'
alias ct='clear && tree'
alias l='ls -lAh'
alias la='ls -lA'

# gnome
alias open='xdg-open'
alias copy='xclip -selection clip-board -in'
alias paste='xclip -selection clip-board -out'

# git
alias cgs='clear && gst'
alias gst='git status -sb'
alias gl='git log --pretty=oneline --abbrev-commit'

# programs
alias venv='source virtual_env/bin/activate'
alias evi=evince

# equality
alias woman=man



# FUNCTIONS
bakify() {
  local file
  for file in "$@"
  do
    cp $file $file.bak
  done
}

ffind() {
  find . -name "*$1*"
}

mkcd() {
  mkdir $1
  cd $1
}

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; echo; rm -f $tmpfile;
}

share() {
  transfer $@ | copy
}


function portal() {
  local PORTAL="$HOME/.config/portal.dest"

  # no arguments: cd to portal destination
  if [ $# -eq 0 ] ; then
    if [ -e "$PORTAL" ] ; then
      cd $(cat "$PORTAL")
    fi
  fi

  # one argument: clear or set portal destination
  if [ $# -eq 1 ] ; then
    if [ "$1" = "clear" ] ; then
      echo "Removing portal" $(cat "$PORTAL")
      rm $PORTAL
    else
      echo "Creating portal to $1"
      # expand possibly relative path
      local full_path=$(readlink -f "$1")
      echo $full_path > $PORTAL
      portal
    fi
  fi
}
portal

