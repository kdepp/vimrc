#!/bin/bash

CWD=`pwd`
DIR=`dirname $0`
MSG_PREFIX="Install:"

# copy .vimrc to ~
if [[ -f $DIR/.vimrc ]]; then
	if [[ -f ~/.vimrc ]]; then
		mv ~/.vimrc ~/.vimrc_backup && \
		echo "$MSG_PREFIX your old .vimrc moved to ~/.vimrc_backup"
	fi
	cp $DIR/.vimrc ~ && \
	echo "$MSG_PREFIX .vimrc copied to ~"
else
	echo "$MSG_PREFIX cannot find .vimrc in repository."
fi

# set up pathogen
echo "$MSG_PREFIX installing Pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
echo "$MSG_PREFIX Pathogen installed."

# set up Trinity
echo "$MSG_PREFIX installing Trinity..."
cd ~/.vim/bundle && \
git clone https://github.com/wesleyche/Trinity && \
echo "$MSG_PREFIX Trinity installed."

cd $CWD
