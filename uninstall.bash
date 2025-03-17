#!/bin/bash
# \brief install all the configs using symlinks, points to here
# установить все конфиги с помощью ссылок сюда

CONFIG_NAME="kio_setup"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
chmod 700 "$SCRIPT_DIR/"
chmod 700 "$SCRIPT_DIR/kio_setup/"
chmod 700 "$SCRIPT_DIR/kio_setup/*"


rm $HOME/.tmux.conf.bak
if [ -f $HOME/.tmux.conf.bak ]; then
  mv $HOME/.tmux.conf.bak $HOME/.tmux.conf
  tmux source-file "$HOME/.tmux.conf"
fi

# unlink ./nvim/ to ~/.config/nvim/
ln -s "$SCRIPT_DIR/nvim/" "$HOME/.config/"
rm -rf "$HOME/.config/nvim/"

# unlink ./bin/ to ~/.local/bin/
rm -rf "$HOME/.local/bin/"

# rm mnt/[build,bmc,ssh,1..9] folders
rm -rf "$HOME/mnt/"{build_server,bmc,ssh}
rm -rf "$HOME/mnt/ssh/"{0..9}

rm -rf "$HOME/.config/"


FILE_NAME=".bashrc"
ln -sf "$SCRIPT_DIR/$CONFIG_NAME/$FILE_NAME" "$HOME/$FILE_NAME"
rm -rf "$HOME/$FILE_NAME"

