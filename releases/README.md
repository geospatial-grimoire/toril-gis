# Toril GIS Releases

This directory is the public release surface for Toril GIS.

## Folder Layout

Each release is stored in an immutable folder named:

```text
tgis-YYYY-MM-DD_N/
```

Example:

```text
releases/
  tgis-2026-07-04_1/
    manifest.json
    data-changelog.json
    release-notes.md
    checksums.txt
    artifacts/
```

## Required Files

- `manifest.json` records release ID, version, date, source repository references, artifact list, and checksums.
- `data-changelog.json` records public changelog entries included in the release.
- `release-notes.md` is the human-readable release summary.
- `checksums.txt` stores checksums for published artifacts.

## Publication Rules

- Release folders are prepared by `toril-ops-console` and reviewed before commit.
- Public release IDs use `tgis-YYYY-MM-DD_N`.
- Release commits and tags use the same release ID.
- Do not publish raw database dumps, local paths, credentials, or temporary files.
- If a release artifact contract changes, update Toril Explorer consumers and console workflow documentation in the same release branch.