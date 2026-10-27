Prefix: RAWZ
Next: 2

### RAWZ-1 · P3 · Colon normalization rewrites legal entry names

- **Area:** Data
- **Where:** `src/path.rs:241`, `src/writer.rs:37`
- **Problem:** `ZipFilePath::from_str` keeps only the suffix after the last colon. `new_file("notes:draft.txt")` stores `draft.txt`, the same name as `new_file("draft.txt")`. `foo:bar:baz` becomes `baz`. The module docs called this drive-letter removal. On macOS and Linux, the platforms this fork supports, `:` is a normal filename character, so the default write path silently renames the entry. `EntryPath::verbatim` still stores the original bytes. A probe on this checkout printed `from_str "notes:draft.txt" -> "draft.txt"` and stored bytes `draft.txt`.
- **Recommendation:** After slash normalization, strip one leading drive prefix (`^[A-Za-z]:`) and leave every other colon in place. Keep the `..`, `.`, and leading-slash rules. Extend `path::tests::test_zip_path_normalized` with `notes:draft.txt` and `foo:bar:baz`.
- **Fix with:** none
- **Effort:** S
- **Design:** [docs/rfc/RAWZ-1-colon-normalization.md](docs/rfc/RAWZ-1-colon-normalization.md)
