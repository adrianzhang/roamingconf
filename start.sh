#!/bin/bash

# This script used to automatically sync configurations of zsh, oh-my-zsh, sublime Text 2 & 3, etc.

echo "Please install zsh, chsh -s $(which zsh) & relogin, install oh-my-zsh at first. Also install Sublime Text 2 or 3 manually before running this script, if not press Ctrl-C to exit."
echo "a) Elementory OS (Ubuntu based)"
echo "b) Mac OS X"
CURRENTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
read -p "Please select current OS (input a or b and press Enter)-->"
if [[ "$REPLY" != [a,b] ]]; then
	exit 0
else
	case "$REPLY" in
		a)
			SL2DIR=$HOME/.config/sublime-text-2
			SL3DIR=$HOME/.config/sublime-text-3
			;;
		b)
			SL2="/Library/Application Support/Sublime Text 2"
			SL3="/Library/Application Support/Sublime Text 3"
			SL2DIR=$HOME$SL2
			SL3DIR=$HOME$SL3
			;;
	esac
	
	if [ -d "$SL2DIR" ]; then
		rm -r "$SL2DIR"/Packages/User
		ln -s $CURRENTDIR/sublime2/User/ "$SL2DIR"/Packages/User
		echo "Sublime Text 2 configuration synced"
	else
		echo "Sublime Text 2 not installed"
	fi

	if [ -d "$SL3DIR" ]; then
		rm -r "$SL3DIR"/Packages/User
		ln -s $CURRENTDIR/sublime3/User/ "$SL3DIR"/Packages/User
		echo "Sublime Text 3 configuration synced"
	else
		echo "Sublime Text 3 not installed"
	fi

	if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
		rm -f ~/.zshrc
		ln -s $CURRENTDIR/.zshrc ~/.zshrc
		# replace the PATH due to .zshrc used on different machine
		sed "/export PATH=/ c\\
		export PATH=\"$PATH\"
		" ~/.zshrc > /tmp/abc
		mv -f /tmp/abc $CURRENTDIR/.zshrc
		echo "zsh conf synced"
	else
		echo "install zsh at first"
		exit 0
	fi

	if [ -d ~/.oh-my-zsh ]; then
		# remove original ~/.oh-my-zsh
		rm -rf ~/.oh-my-zsh
		ln -s $CURRENTDIR/oh-my-zsh ~/.oh-my-zsh
		echo "oh-my-zsh conf synced"
	else
		echo "install oh-my-zsh fist"
		exit 0
	fi
	
fi
exit 0
