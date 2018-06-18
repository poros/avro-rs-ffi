# BUILDING

include/avro_rs.h: $(shell find src -type f -name "*.rs")
	RUSTUP_TOOLCHAIN=nightly cbindgen -v -c cbindgen.toml . -o $@

.PHONY: build
build: include/avro_rs.h
	cargo build

.PHONY: release
release: include/avro_rs.h
	cargo build --release

# TESTING

.PHONY: test
test: include/avro_rs.h
	cargo test

# LINTING

.PHONY: lint
lint:
	cargo +nightly fmt

.PHONY: clippy
clippy:
	cargo +nightly clippy --all-features

# CLEANING

.PHONY: clean
clean:
	cargo clean
	rm -rf include
