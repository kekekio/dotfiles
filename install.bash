#!/bin/bash
# \brief install all the configs using symlinks, points to here
# установить все конфиги с помощью ссылок сюда

umask 0077
CONFIG_NAME="kio_setup"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod 700 -R "$SCRIPT_DIR/"

mkdir -p "$HOME/mnt/"{build_server,bmc,ssh}
mkdir -p "$HOME/mnt/ssh/"{0..9}

if [ -f $HOME/.tmux.conf ]; then
  mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi
FILE_NAME=".tmux.conf"
ln -sf "$SCRIPT_DIR/tmux/$FILE_NAME" "$HOME/$FILE_NAME"
tmux source-file "$HOME/.tmux.conf"

# link ./nvim/ to ~/.config/nvim/
ln -s "$SCRIPT_DIR/nvim/" "$HOME/.config/"

# link ./bin/ to ~/.local/bin/
mkdir -p $HOME/.local/
ln -s "$SCRIPT_DIR/bin/" "$HOME/.local/"

ln -s "$SCRIPT_DIR/$CONFIG_NAME/" "$HOME/.config/"

#make mnt/[build,bmc,ssh,1..9] folders
mkdir -p "$HOME/mnt/"{build_server,bmc,ssh}
mkdir -p "$HOME/mnt/ssh/"{0..9}

FILE_NAME=".bashrc"
ln -sf "$SCRIPT_DIR/$CONFIG_NAME/$FILE_NAME" "$HOME/$FILE_NAME"

