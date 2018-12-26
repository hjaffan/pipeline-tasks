#!/bin/bash

ROOT_DIR=$PWD
cp -r source/. full-source/

pushd ${ROOT_DIR}/full-source
    cat > config/private.yml <<EOL
---
blobstore:
  provider: s3
  options:
    access_key_id: ${AWS_ACCESS_KEY_ID}
    secret_access_key: ${AWS_SECRET_ACCESS_KEY}
EOL
popd
