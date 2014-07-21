#!/bin/sh

function git_rm_symlink() {
    git checkout -- "$1"
    link=$(echo "$1")
    doslink=${link//\//\\}
    dest=$(dirname "$link")/$(cat "$link")
    dosdest=${dest//\//\\}
    if [ -f "$dest" ]; then
        rm -f "$link"
        cmd //C mklink //H "$doslink" "$dosdest"
    elif [ -d "$dest" ]; then
        rm -f "$link"
        cmd //C mklink //J "$doslink" "$dosdest"
    else
        echo "ERROR: Something went wrong when processing $1 . . ."
        echo "       $dest may not actually exist as a valid target."
    fi
}

function git_rm_symlinks() {
    for symlink in `git ls-files -s | egrep "^120000" | cut -f2`; do
        git_rm_symlink "$symlink"
        git update-index --assume-unchanged "$symlink"
    done
}

git_rm_symlinks
exit 0
