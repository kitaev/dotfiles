#!/bin/sh

git_checkout_symlinks() {
    for symlink in `git ls-files -s | egrep "^120000" | cut -f2`; do
        git update-index --no-assume-unchanged "$symlink"
        dossymlink=${symlink//\//\\}
        cmd //C rmdir //Q "$dossymlink" 2>/dev/null
        git  checkout -- "$symlink"
        echo "Restored git symlink $symlink <<===>> `cat $symlink`"
    done
}

git_checkout_symlinks
exit 0
