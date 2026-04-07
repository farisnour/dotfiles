# Custom bash behaviour/settings

# -- Cycle history with prefix
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# -- Separate history for each terminal
export HISTFILE="~/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND='history -a'

# -- Aliases
alias grep="grep --color"
