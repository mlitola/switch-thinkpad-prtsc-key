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

# generate script file(s) to execute key changes
echo "#!/bin/bash" >> $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
echo "/usr/bin/xkbcomp -w0 -I$HOME/.xkb $HOME/.xkb/keymap/mykb $DISPLAY" >> $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
echo "#!/bin/bash" >> $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh
echo "/usr/bin/xkbcomp -w0 -I$HOME/.xkb $HOME/.xkb/keymap/orgkb $DISPLAY" >> $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh
chmod +x $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh
chmod +x $INSTALL_DIR_ROOT/turn_prsc_back_to_original.sh

# execute key swap script
sh $INSTALL_DIR_ROOT/turn_prsc_into_altgr.sh

echo "Prints Screen key is now swapped into Alt Gr key"

