Prefix: RAWZ
Next: 2

## Done

### RAWZ-1 · P3 · Colon normalization rewrites legal entry names

- Fixed: `normalize_alloc` strips one leading `<letter>:` prefix and keeps every other colon. Covered by `notes:draft.txt` and `foo:bar:baz` cases in `path::tests::test_zip_path_normalized`.
