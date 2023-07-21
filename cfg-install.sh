#!/bin/sh

# To exec use:
# curl -Lks https://raw.githubusercontent.com/tsa96/dotfiles/main/cfg-install.sh | /bin/sh

# Based on https://www.atlassian.com/git/tutorials/dotfiles

rm cfg-install.sh # lol

sudo apt-get install zsh

git clone --bare https://github.com/tsa96/dotfiles.git "$HOME"/.cfg
git clone https://github.com/romkatv/powerlevel10k "$HOME/powerlevel10k" # Hack, can't get submodules to work with this

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
