# zmodload zsh/zprof

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# plugins
# plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
# plug "hlissner/zsh-autopair"
# plug "zap-zsh/supercharge"
# plug "zap-zsh/vim"
# plug "spaceship-prompt/spaceship-prompt"
# plug "zap-zsh/atmachine-prompt"
plug "zdharma-continuum/fast-syntax-highlighting"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
# plug "zsh-users/zsh-syntax-highlighting"

# zprof
