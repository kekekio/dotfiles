#!/bin/bash
# \brief setup all env vars

export MOUNT_FUSE_DIR="$HOME/mnt"
CONFIG_PATH="$HOME/.config/kio_setup/servers.json"
SERVERS_JSON=$(cat "$CONFIG_PATH")


export ALICE_SERVER_IP=$(jq ".alice_server.ip" -r <<< $SERVERS_JSON)
export ALICE_SERVER_USERNAME=$(jq ".alice_server.username" -r <<< $SERVERS_JSON)
function connect_alice() {
	ssh $ALICE_SERVER_USERNAME@$ALICE_SERVER -t tmux attach-session
}
function mount_alice() {
	export ALICE_MOUNT_POINT="$MOUNT_FUSE_DIR/ssh/0"
	sshfs -o allow_other $ALICE_SERVER_USERNAME@$ALICE_SERVER:/ $ALICE_MOUNT_POINT
}
function umount_alice() {
	sudo umount -l $ALICE_MOUNT_POINT
}
export -f connect_alice
export -f mount_alice
export -f umount_alice


export BUILDER_SERVER_IP=$(jq ".build_server.ip" -r <<< $SERVERS_JSON)
function connect_builder() {
	ssh $BUILDER_SERVER_IP -t tmux attach-session
}
function mount_builder() {
	sshfs -o allow_other $BUILDER_SERVER_IP:/ $MOUNT_FUSE_DIR/build_server/
}
function umount_builder() {
	sudo umount -l $MOUNT_FUSE_DIR/build_server/
}
export -f connect_builder
export -f mount_builder
export -f umount_builder

function mount_bmc() {
	ssh-lan-connect-mount.sh 0penBmc /home/kio/mnt/bmc
}
function umount_bmc() {
	sudo umount -l "$HOME/mnt/bmc"
}
export -f mount_bmc
export -f umount_bmc

#source $fullfile


