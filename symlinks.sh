#! /bin/sh
#
# symlinks.sh
# Copyright (C) 2025 stantonik <stantonik@stantoniks-MacBook-Air.local>
#
# Distributed under terms of the MIT license.
#

mkdir -p $HOME/.config
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.config/nvim $HOME/.config/nvim

