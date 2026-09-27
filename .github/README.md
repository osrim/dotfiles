# dotfiles

macOS config managed with [yadm](https://yadm.io). The work tree is `$HOME`.

- zsh without a framework, with starship, atuin, zoxide and fzf-tab
- Ghostty and Zellij in the terminal
- Zed and Neovim as editors
- git with delta, and commits signed with an SSH key from 1Password
- mise for language versions, Homebrew for the rest
- Catppuccin theme in every tool that supports it

## Files

| Path | Contents |
|------|----------|
| `.zshrc`, `.zsh/` | Shell config, aliases and functions |
| `.gitconfig` | Git config and aliases |
| `.homebrew/Brewfile` | Homebrew formulae and casks |
| `.config/zed/`, `.config/nvim/` | Editor config |
| `.config/zellij/`, `Library/Application Support/com.mitchellh.ghostty/` | Terminal config |
| `.config/atuin/` | Shell history config |
| `AGENTS.md`, `.claude/settings.json` | Instructions and settings for coding agents |

## Setup

Install [Homebrew](https://brew.sh) first, then:

```sh
brew install yadm
yadm clone https://github.com/osrim/dotfiles.git
brew bundle --file ~/.homebrew/Brewfile
```

## Local config

Git identity and the signing key are not tracked. Copy the example and fill it in:

```sh
cp ~/.gitconfig.local.example ~/.gitconfig.local
```

Secrets such as API keys go in `~/.zshenv`, which is not tracked.
