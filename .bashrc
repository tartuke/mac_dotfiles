alias rni="kill $(lsof -t -i:8081); rm -rf ios/build/; npx react-native run-ios"



# Load Angular CLI autocompletion.
source <(ng completion script)
source ~/.cargo/env
. "$HOME/.cargo/env"



[ -f "/Users/isaaclefler/.ghcup/env" ] && . "/Users/isaaclefler/.ghcup/env" # ghcup-env
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
