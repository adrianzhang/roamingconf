#!/bin/bash

# This script used to automatically sync configurations of zsh, oh-my-zsh, sublime Text 2 & 3, etc.

echo "welcome"

CURRENTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OSTYPE=`uname`
if [[ "$OSTYPE" != "Darwin" && "$OSTYPE" != "Linux"] ]]; then
	exit 0
else
	case "$OSTYPE" in
		Linux)
			SL2DIR=$HOME/.config/sublime-text-2
			SL3DIR=$HOME/.config/sublime-text-3
			;;
		Darwin)
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
		echo "zsh not installed"
		exit 0
	fi

	if [ -d ~/.oh-my-zsh ]; then
		# remove original ~/.oh-my-zsh
		rm -rf ~/.oh-my-zsh
		ln -s $CURRENTDIR/oh-my-zsh ~/.oh-my-zsh
		echo "oh-my-zsh conf synced"
	else
		echo "oh-my-zsh not installed"
		exit 0
	fi

fi
exit 0
