# Set HOST_NAME to the name configured in git
HOST_NAME=$(git config user.name)

# Source the necessary environment setup scripts
# source ~/.nvm/nvm.sh
source ~/.cargo/env
source ~/.ghcup/env

# Lazy load nvm
loadnvm() {
  unset -f nvm node npm npx
  . "$HOME/.nvm/nvm.sh"
  nvm use stable
  if [[ $# -gt 0 ]]; then
    "$@"
  fi
}

nvm() { loadnvm nvm "$@"; }
node() { loadnvm node "$@"; }
npm() { loadnvm npm "$@"; }
npx() { loadnvm npx "$@"; }

# Source .zshrc if it exists, for compatibility
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
fi

# Use the stable version of Node with nvm
# nvm use stable

# Zsh equivalent of 'shopt -s histappend'
setopt APPEND_HISTORY

# Set PATH
export PATH=$PATH:$HOME/bin

# History settings
export HISTSIZE=5000
export HISTFILESIZE=10000

# Key bindings for history search
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
bindkey "^I" menu-complete

# Color settings for CLI
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Color variables
txtred='%F{red}' # Red
txtgrn='%F{green}' # Green
bldgrn='%F{bold}%F{green}' # Bold Green
bldpur='%F{bold}%F{magenta}' # Bold Purple
txtrst='%f'    # Text Reset

# Emoji array
emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")

# Select a random emoji
EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

# Function to dynamically update the prompt
update_prompt() {
    local username=$(git config --get user.name) # Attempt to fetch GitHub username
    local dir="${PWD/#$HOME/~}" # Replace home directory with ~
    [[ -z "$username" ]] && username="%n" # If GitHub username is not found, use system username (%n)
    
    PROMPT="
${EMOJI} $txtred$username: $bldpur$dir $txtgrn $(vcprompt)
$txtrst%# " # %n is the username, %# is the prompt character (% or #)
}

# Note: In Zsh, 'precmd_functions' is used instead of 'PROMPT_COMMAND' in Bash
precmd_functions+=(update_prompt)


function mkcd()
{
   mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias 🍺="git checkout -b drunk"
alias a='code .'
alias c='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias l="ls" # List files in current directory
alias ll="ls -a" # List all files in current directory
alias lll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
alias gst='git stash'
alias gstp='git stash pop'