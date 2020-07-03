#!/bin/bash -px

# manually purge submodule reference in .gitmodules
# may need to purge submodule reference in .git/config
# git reset HEAD .gitmodules deps/pybind11
mod=opendnp3
branch=def-analog-g30v5
url=https://github.com/shipmints/$mod.git

git submodule deinit deps/$mod
git rm --cached deps/$mod
rm -rf .git/modules/deps/$mod
rm -rf deps/$mod
cd deps
git submodule add -b $branch $url
# git submodule add https://github.com/automatak/dnp3.git
git submodule update --init --recursive
# cd dnp3
# git checkout 71e767f4c4baae8e866406b964d9e8ffaafa02d8
# cd ../..

# EOF
