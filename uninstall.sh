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

echo "Software uninstalled and Print Screen key returned into normal state"
