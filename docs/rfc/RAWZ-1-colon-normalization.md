# RAWZ-1: Colon normalization rewrites legal entry names

Status: draft

## Summary

`ZipFilePath` normalization should strip a leading Windows drive prefix and leave other colons in the entry name.

## Motivation

`normalize_alloc` does `split(':').next_back()`. A conformant `ZipArchiveWriter::new_file` uses that path. `notes:draft.txt` and `draft.txt` become the same stored name, so a later entry replaces the earlier one on extract. This fork supports macOS and Linux, where `:` is a legal filename character, and does not support Windows.

`EntryPath::verbatim` already writes the original bytes. The default `&str` conversion does not.

## Design

After `\` is rewritten to `/`, remove one leading prefix that matches an ASCII letter, a colon, and an optional slash. Then resolve `.`, `..`, and repeated or leading slashes as today.

The drive-letter cases in `src/path.rs` keep today's results. `notes:draft.txt` and `foo:bar:baz` stay unchanged.

## Alternatives considered

- Keep the suffix-only rule and document it. Callers who care can use `EntryPath::verbatim`. The default `new_file("notes:draft.txt")` still renames the entry.
- Reject any name that contains a colon. That fails archives and writers that use a legal Unix name.

## Open questions

- Should a Windows extractor built on this crate reject colon names itself? Recommendation: yes. This crate does not support Windows, and colon stripping is the wrong place to stop alternate data streams.

## Decision

Pending.
