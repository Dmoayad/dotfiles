case "$(uname -s)" in
Darwin)
	# Set PATH, MANPATH, etc., for Homebrew.
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export PATH=/usr/local/sbin:$PATH
	;;
esac
