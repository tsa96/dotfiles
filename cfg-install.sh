#!/bin/sh

# To exec use:
# curl -Lks https://raw.githubusercontent.com/tsa96/dotfiles/main/cfg-install.sh | /bin/sh

#git clone --bare https://github.com/tsa96/dotfiles.git "$HOME"/.cfg

config() {
	git --git-dir="$HOME"/.cfg/ --work-tree="$HOME"/ "$@"
}

mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
	echo "Checked out config."
else
	echo "Backing up pre-existing dot files."
	config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi

config checkout
config config status.showUntrackedFiles no
