case "$(uname -s)" in
Darwin)
	# Set PATH, MANPATH, etc., for Homebrew.
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH=/usr/local/sbin:$PATH
	;;
esac

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
