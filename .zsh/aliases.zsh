[[ -n "$CLAUDECODE" ]] || alias cd="z"
alias -g ...='../..'
alias -g ....='../../..'
alias ls="eza -la --git --icons --group-directories-first"
alias ll="ls"
alias lsd="eza -laD --git --icons"
alias lst="eza -T --icons --group-directories-first -I=\".git|.history|node_modules\""
alias lstd="eza -DT -I=\".git|.history|node_modules\""
alias cat="bat --paging=never"
alias find="fd"
alias top="bpytop"
alias rmf="rm -rf"
alias ip="curl icanhazip.com"
alias ping="gping"

alias code="open -a Visual\ Studio\ Code.app"
alias v="nvim"

alias g="git"

alias b="brew"
alias n="npm"
alias p="pnpm"
alias y="yarn"

alias d="docker"
alias dc="docker compose"

alias tm="tmux"
alias tms="tmux new -s"
alias tma="tmux attach -t"
alias tmr="tmux rename-session -t"

# pi uses the Codex OAuth login, not OPENAI_API_KEY (which points elsewhere)
alias pi='env -u OPENAI_API_KEY pi'
