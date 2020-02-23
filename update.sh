#! /usr/bin/env bash
set -eu

install_dir=$(readlink -f $(whereis sysadm-cmd))

mkdir tmp
cd tmp
git clone https://github.com/annahri/sysadm-cmd
cd sysadm-cmd

install -v sysadm-cmd "$install_dir"
install -v modules/*.shm "$install_dir"/modules
install -v modules/functions/*.shm "$install_dir"/modules/functions

echo
echo "Done updating."

cd ../..
rm -rf tmp
