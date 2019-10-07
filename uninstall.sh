#!/bin/bash
#
# Uninstall script for removing
# Print Screen key swap into Alt Gr
#
###########################################
INSTALL_DIR_ROOT=$HOME/.xkb
INSTALL_DIR_KEYMAP=$HOME/.xkb/keymap
INSTALL_DIR_SYMBOLS=$HOME/.xkb/symbols

# first return old key combo
sh $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh

# remove files and dirs
rm -f $INSTALL_DIR_KEYMAP/mykb
rm -f $INSTALL_DIR_KEYMAP/orgkb
rm -f $INSTALL_DIR_SYMBOLS/myswap
rm -f $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh
rm -f $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
rmdir $INSTALL_DIR_KEYMAP
rmdir $INSTALL_DIR_SYMBOLS
rmdir $INSTALL_DIR_ROOT

# suggest changes as startup
echo "Software uninstalled and Print Screen key returned into normal state"
echo "\nIf you did copied script to run on startup, you need to removed it with sudo:\n"
echo "sudo rm -f /etc/init.d/turn_prsc_into_altgr.sh\n"
echo "\nand remove it from runlevels:\n"
echo "sudo update-rc.d -f turn_prsc_into_altgr.sh remove\n"
