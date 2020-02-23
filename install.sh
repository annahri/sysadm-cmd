#! /usr/bin/env bash

set -euo pipefail

base_dir=$(dirname $(readlink -f $0))
scripts_dir="/opt/scripts"
sysadm_dir="$scripts_dir/sysadm-cmd"
bin_dir="/usr/local/bin"

# Run as root only
[ "$EUID" -ne 0 ] && {
	echo "Please run as previleged user."
	exit 1
}

# Check if $sysadm_dir exists and installed
[ -d "$sysadm_dir" ] && [ -h "$bin_dir/sysadm-cmd" ] && { 
	echo "sysadm-cmd is already installed on this machine."
	exit 1
}

# Create dir
mkdir -p $sysadm_dir/modules/functions

# Install scrpits
echo "Installing sysadm-cmd"
echo
install -v $base_dir/sysadm-cmd $sysadm_dir
install -v $base_dir/uninstall.sh $sysadm_dir
install -v $base_dir/update.sh $sysadm_dir
install -v $base_dir/modules/*.shm $sysadm_dir/modules
install -v $base_dir/modules/functions/*.shm $sysadm_dir/modules/functions
chmod u+x $sysadm_dir/sysadm-cmd
ln -s $sysadm_dir/sysadm-cmd $bin_dir/sysadm-cmd
echo
tree $sysadm_dir
echo "Done"

