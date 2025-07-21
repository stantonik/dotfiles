#! /bin/sh
#
# symlinks.sh
# Copyright (C) 2025 stantonik <stantonik@stantoniks-MacBook-Air.local>
#
# Distributed under terms of the MIT license.
#

symlink() {
    local relpath="$1"
    local source="$HOME/dotfiles/$relpath"
    local target="$HOME/$relpath"

    # Create parent directory for the target if needed
    mkdir -p "$(dirname "$target")"

    # Check if symlink already exists
    if [ -L "$target" ]; then
        echo "Symlink already exists at $target"

        # Check if file/folder exists but is NOT a symlink
    elif [ -e "$target" ]; then
        echo "Warning: $target exists and is not a symlink. Please remove or back it up before continuing."
    else
        ln -s "$source" "$target"
        echo "Symlink created: $target -> $source"
    fi
}

# Create the symlinks
symlink .zshrc
symlink .config/nvim
symlink .clang-format

