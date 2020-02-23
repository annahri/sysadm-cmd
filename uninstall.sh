#! /usr/bin/env bash

set -eu

[ "$EUID" -ne 0 ] && {
	echo "Please run as root only."
	exit 1
}

bin_dir=$(whereis sysadm-cmd | awk '{print $2}')
install_dir=$(readlink -f "$bin_dir")
install_dir="${install_dir%/*}"

echo "Uninstalling sysadm-cmd"
unlink "$bin_dir"
rm -rf "$install_dir"
echo "Done"
