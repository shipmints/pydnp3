#!/bin/bash -px

# manually purge submodule reference in .gitmodules
# may need to purge submodule reference in .git/config
# git reset HEAD .gitmodules deps/pybind11
mod=pybind11
branch=allow_pointer_copies
url=https://github.com/shipmints/$mod.git
git submodule deinit deps/$mod
git rm --cached deps/$mod
rm -rf .git/modules/deps/$mod
rm -rf deps/$mod
cd deps
git submodule add -b $branch $url
# cd $mod && git checkout $branch
cd ..
# git submodule update --init --recursive
# git submodule update --init

# EOF
