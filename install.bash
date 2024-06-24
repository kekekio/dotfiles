#!/bin/bash
# \brief install all the configs using symlinks, points to here
# установить все конфиги с помощью ссылок сюда

CONFIG_NAME="kio_setup"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p "$HOME/mnt/"{build_server,bmc,ssh}
mkdir -p "$HOME/mnt/ssh/"{0..9}

FILE_NAME=".tmux.conf"
ln -sf "$SCRIPT_DIR/tmux/$FILE_NAME" "$HOME/$FILE_NAME"
tmux source-file "$HOME/.tmux.conf"

ln -s "$SCRIPT_DIR/nvim/" "$HOME/.config/"

ln -s "$SCRIPT_DIR/$CONFIG_NAME/" "$HOME/.config/"

FILE_NAME=".bashrc"
ln -sf "$SCRIPT_DIR/$CONFIG_NAME/$FILE_NAME" "$HOME/$FILE_NAME"

