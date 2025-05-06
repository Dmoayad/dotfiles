#!/bin/sh
alias j='z'
alias f='zi'
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias src='source ~/.config/zsh/.zshrc'

# vim
alias vim='nvim'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

# get top process eating memory
# alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
# alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
# alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
# alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# For when keys break
# alias archlinx-fix-keys="sudo pacman-key --init && sudo pacman-key --populate archlinux && sudo pacman-key --refresh-keys"

# systemd
# alias mach_list_systemctl="systemctl list-unit-files --state=enabled"

# alias mach_java_mode="export SDKMAN_DIR="$HOME/.sdkman" && [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh""

# alias m="git checkout master"
# alias s="git checkout stable"

# ALIASES ##
# Changing "ls" to "exa"
alias ls='eza --group-directories-first --icons'                     # listing
alias lla='eza -al --color=always --group-directories-first --icons' # my preferred listing
alias la='eza -a --color=always --group-directories-first --icons'   # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'   # long format
alias lt='eza -aT --color=always --group-directories-first --icons'  # tree listing

case "$(uname -s)" in

Darwin)
    # echo 'Mac OS X'
    # brew aliases
    alias brewup='brew update && brew upgrade'
    alias brewcup='brew list --cask | xargs brew upgrade'
    alias brewin='brew install'
    alias brewrm='brew uninstall'
    alias python=python3
    alias pip=pip3
    ;;

Linux)
    alias open='xdg-open'
    alias mime='xdg-mime'
    # get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
    ;;

CYGWIN* | MINGW32* | MSYS* | MINGW*)
    # echo 'MS Windows'
    ;;
*)
    # echo 'Other OS'
    ;;
esac
