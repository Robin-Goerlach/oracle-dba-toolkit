# Contributor instructions
- English is the default language. Keep documentation and scripts version-specific.
- Start with Oracle 8.0.5; do not introduce later features into this baseline.
- Prefer SQL*Plus, portable Bourne shell and Perl where appropriate.
- Document privileges, inputs, output, side effects and error handling.
- Read-only diagnostics by default; destructive operations require explicit approval and an isolated lab.
- Never commit credentials, proprietary binaries, real database dumps or sensitive diagnostic output.
- Cite sources; verify licenses before copying third-party code.
- Distinguish static review from execution against a real Oracle release.
- Do not claim compatibility without evidence. Preserve existing files and avoid force pushes.

- Maintain German companion documentation (.de.md) alongside English originals.
- Work directly in main. Original contributions use MIT.
- Follow [engineering policy](docs/ENGINEERING-POLICY.md), including R/C/M/D risk classes and deferred runtime validation. Oracle leads; MySQL may begin after the Oracle8 source baseline is complete and statically reviewed.
