typeset -U path
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$HOME/.qlty/bin:$PATH"
export PATH="$PNPM_HOME/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.lmstudio/bin"
export PATH="$PATH:$HOME/.bun/bin"

export EDITOR=nvim
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export COPILOT_CUSTOM_INSTRUCTIONS_DIRS="$HOME"
export CRUSH_SKILLS_DIR="$HOME/.agents/skills"

# Force emacs mode before plugins bind keys (EDITOR=nvim makes zsh default to vi mode)
bindkey -e
bindkey "^[[1;3C" forward-word   # Alt+Right
bindkey "^[[1;3D" backward-word  # Alt+Left

autoload -U compinit; compinit
source ~/.fzf-tab/fzf-tab.plugin.zsh
[ -s ~/.bun/_bun ] && source ~/.bun/_bun

eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
[[ -n "$CLAUDECODE" ]] || eval "$(zoxide init zsh)"
command -v wt >/dev/null && eval "$(command wt config shell init zsh)"

source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
