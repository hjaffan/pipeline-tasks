#!/bin/bash

cp -r source/* full-source/
function sub_update {
    git submodule sync
    git submodule foreach --recursive 'git submodule sync; git clean -d --force --force'
    git submodule update --init --recursive --force
    git clean -ffd
}

sub_update

pushd full-source/src/$SRC_PATH
    git checkout $BRANCH_NAME
    sub_update
popd