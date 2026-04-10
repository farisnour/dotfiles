# Custom bash behaviour/settings

# -- Add local dirs to PATH
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
	PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

[[ ":$PATH:" != *":/usr/local/bin:"* ]] && export PATH="/usr/local/bin:$PATH"

# -- Cycle history with prefix
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# -- Separate history for each terminal
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
PROMPT_COMMAND='history -a'

# -- Aliases
alias grep="grep --color"

# fzf shell integrations
if command -v fzf &>/dev/null
then
	eval "$(fzf --bash)"
fi
