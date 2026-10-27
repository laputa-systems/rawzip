# rawzip

Low-level Zip reader and writer. No runtime dependencies. `forbid(unsafe_code)`.

## Commands

- `cargo test --all` runs the library, integration, and doc tests.
- `cargo build --no-default-features --target x86_64-unknown-none` builds the core tier. Add `--features alloc` for the alloc tier.

`rust-toolchain.toml` pins `nightly-2026-09-15`. The MSRV in `Cargo.toml` is 1.85. Do not use nightly-only syntax.

## Invariants

- Supported hosts are macOS and Linux. Windows is not supported.
- The central directory is authoritative for CRC and sizes. `verifying_reader` checks them. Size hints are not validated.
- `ZipFilePath::try_normalize` is opt-in. A raw path can escape a destination directory.
- A central-directory parse error ends iteration. Later calls return `Ok(None)`.

## Map

- `docs/01-reading.md` is `crate::guide::reading`.
- `docs/02-performance.md` is `crate::guide::performance`.
- `docs/03-validation.md` is `crate::guide::validation`.
- `docs/04-encryption.md` is `crate::guide::encryption`.
- `TODO.md` lists open work. `docs/rfc/RAWZ-1-colon-normalization.md` is the open decision for colon normalization.

`README.md` is generated from the crate-level docs in `src/lib.rs`.
