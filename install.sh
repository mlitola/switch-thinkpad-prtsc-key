#!/bin/bash
#
# Small install script for Installing
# xkb modification to switch Print screen
# key into a Alt Gr key
#
###########################################
INSTALL_DIR_ROOT=$HOME/.xkb
INSTALL_DIR_KEYMAP=$HOME/.xkb/keymap
INSTALL_DIR_SYMBOLS=$HOME/.xkb/symbols

# create install dirs
mkdir -p $INSTALL_DIR_KEYMAP
mkdir -p $INSTALL_DIR_SYMBOLS

# copy scripts into created directories
cp scripts/mykb $INSTALL_DIR_KEYMAP/.
cp scripts/orgkb $INSTALL_DIR_KEYMAP/.
cp scripts/myswap $INSTALL_DIR_SYMBOLS/.
cp scripts/*.sh $INSTALL_DIR_ROOT/.

# generate script file(s) to execute key changes
echo "#!/bin/bash" >> $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
echo "/usr/bin/xkbcomp -w0 -I$HOME/.xkb $HOME/.xkb/keymap/mykb $DISPLAY" >> $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
echo "#!/bin/bash" >> $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh
echo "/usr/bin/xkbcomp -w0 -I$HOME/.xkb $HOME/.xkb/keymap/orgkb $DISPLAY" >> $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh
chmod +x $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
chmod +x $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh

# suggest changes as startup
echo "Prints Screen key is now swapped into Alt Gr key"
echo "\nIf you want to  use this every startup, copy the script into init.d using sudo:\n"
echo "sudo cp $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh /etc/init.d/.\n"
echo "\nand add it to runlevels:\n"
echo "sudo update-rc.d turn_prsc_into_altgr.sh defaults\n"
