#!/bin/bash
set -ev
cargo install cbindgen
make release
make test
if [ "$TRAVIS_RUST_VERSION" = "nightly" ]; then
    make benchmark
fi
