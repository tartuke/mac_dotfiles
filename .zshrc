alias rni="kill $(lsof -t -i:8081); rm -rf ios/build/; npx react-native run-ios"

# # Load Angular CLI autocompletion.
# autoload -U +X bashcompinit && bashcompinit
# source <(ng completion script)
# source ~/.cargo/env

# Ensure .cargo/env is sourced
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ghcup-env
[[ -f "/Users/isaaclefler/.ghcup/env" ]] && source "/Users/isaaclefler/.ghcup/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"