#!/bin/bash

CWD=`pwd`
DIR_TMP=`dirname $0`
DIR=`cd DIR_TMP; pwd`
PLUGIN_CONFIG_DIR=$DIR/plugin_config
HOME_DIR=~
VIM_DIR=$HOME_DIR/.vim
BUNDLE_DIR=$VIM_DIR/bundle
AUTOLOAD_DIR=$VIM_DIR/autoload
INSTALL_MSG_PREFIX="Install:"
CONFIG_MSG_PREFIX="Config:"

function echo_block () {
	echo -e "\n================================\n"
}

function echo_install () {
	echo "$INSTALL_MSG_PREFIX $1"
}

function echo_config () {
	echo "$CONFIG_MSG_PREFIX $1"
}

echo_block

# copy .vimrc to ~
if [[ -f $DIR/.vimrc ]]; then
	if [[ -f $HOME_DIR/.vimrc ]]; then
		mv $HOME_DIR/.vimrc $HOME_DIR/.vimrc_backup && \
		echo_install "your old .vimrc moved to $HOME_DIR/.vimrc_backup"
		echo_block
	fi
	cp $DIR/.vimrc $HOME_DIR && \
	echo_install ".vimrc copied to $HOME_DIR"
else
	echo_install "cannot find .vimrc in repository."
fi

echo_block

# set up pathogen
if [[ ! -f $AUTOLOAD_DIR/pathogen.vim ]]; then
	echo_install " installing Pathogen..."
	mkdir -p $AUTOLOAD_DIR $BUNDLE_DIR && \
	curl -LSso $AUTOLOAD_DIR/pathogen.vim https://tpo.pe/pathogen.vim && \
	echo_install " Pathogen installed."
	echo_block
fi

# set up plugins to be installed by pathogen
if [[ -f $DIR/pathogen_plugins.txt ]]; then
	while read LINE; do
		NAME_WITH_GIT=${LINE##*/}
		NAME_WITHOUT_GIT=${NAME_WITH_GIT%.*}
		if [[ ! -d $BUNDLE_DIR/$NAME_WITHOUT_GIT ]]; then
			echo_install "installing $NAME_WITHOUT_GIT..."
			cd $BUNDLE_DIR && \
			git clone $LINE && \
			echo_install "$NAME_WITHOUT_GIT installed."
			echo_block
		fi
	done < $DIR/pathogen_plugins.txt
else
	echo_install " no pathogen_plugins.txt file found."
fi

# set up Command-T
if [[ -d $BUNDLE_DIR/Command-T ]]; then
    echo_config "setting up command-t..."
    cd "$BUNDLE_DIR/Command-T/ruby/command-t" && ruby extconf.rb && make
    echo_config "command-t built."
    echo_block
fi

# set up coffee lint
if [[ -d $BUNDLE_DIR/vim-coffee-script ]]; then
    echo_config "setting up coffee-lint..."
    cp $PLUGIN_CONFIG_DIR/coffeelint.json $HOME_DIR
    echo_config "coffee-lint set up."
    echo_block
fi

# set up snipmate
if [[ -d $BUNDLE_DIR/snipmate.vim ]]; then
    echo_config "setting up snipmate..."
    cp -r $DIR/snippets $VIM_DIR
    echo_config "snipmate set up."
    echo_block
fi

cd $CWD
