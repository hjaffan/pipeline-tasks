#!/bin/bash

ROOT_DIR=$PWD
cp -r source/* full-source/
function sub_update {
    git submodule sync
    git submodule foreach --recursive 'git submodule sync; git clean -d --force --force'
    git submodule update --init --recursive --force
    git clean -ffd
}

pushd ${ROOT_DIR}/full-source
    sub_update
popd

pushd ${ROOT_DIR}/full-source/src/$SRC_PATH
    git checkout $BRANCH_NAME
    sub_update
popd