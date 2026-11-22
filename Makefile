.PHONY: lint test

lint:
	cargo clippy --all-targets --all-features -- --deny warnings

test:
	cargo test --all-features

.PHONY: clean
clean:
	@if test -L ./target || { test -e ./target && ! test -d ./target; }; then \
	  printf '%s\n' 'make clean: ./target must be a local build directory' >&2; exit 1; \
	fi
	rm -rf -- ./target
