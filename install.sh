#!/bin/bash

CWD=`pwd`
DIR=`dirname $0`
MSG_PREFIX="Install:"

function echo_block () {
	echo -e "\n================================\n"
}

function echo_install () {
	echo "$MSG_PREFIX $1"
}


# copy .vimrc to ~
if [[ -f $DIR/.vimrc ]]; then
	if [[ -f ~/.vimrc ]]; then
		mv ~/.vimrc ~/.vimrc_backup && \
		echo_install "your old .vimrc moved to ~/.vimrc_backup"
	fi
	cp $DIR/.vimrc ~ && \
	echo_install ".vimrc copied to ~"
else
	echo_install "cannot find .vimrc in repository."
fi

echo_block

# set up pathogen
echo_install " installing Pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
echo_install " Pathogen installed."

echo_block

# set up plugins to be installed by pathogen
if [[ -f $DIR/pathogen_plugins.txt ]]; then
	while read LINE; do
		NAME_WITH_GIT=${LINE##*/}
		NAME_WITHOUT_GIT=${NAME_WITH_GIT%.*}
		echo_install "installing $NAME_WITHOUT_GIT..."
		cd ~/.vim/bundle && \
		git clone $LINE && \
		echo_install "$NAME_WITHOUT_GIT installed."
		echo_block
	done < $DIR/pathogen_plugins.txt
else
	echo_install " no pathogen_plugins.txt file found."
fi

cd $CWD
