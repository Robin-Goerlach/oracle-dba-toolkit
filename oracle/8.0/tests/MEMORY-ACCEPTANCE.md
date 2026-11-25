# Memory diagnostics acceptance
[Deutsch](MEMORY-ACCEPTANCE.de.md)

Status: implemented; static review partial; runtime NOT RUN / DEFERRED.

| ID | Test | Expected |
|---|---|---|
| MEM-01 | Confirm 8.0.5 server and client; record platform and edition | Exact versions recorded |
| MEM-02 | Run SGA inventory with authorized view access | Component values nonnegative; total agrees with component sum |
| MEM-03 | Run detail report | Names and byte values returned; descending byte order |
| MEM-04 | Run parameter report | Only allowlisted names; missing entries investigated |
| MEM-05 | Run with account lacking view access | SQL error; client exits unsuccessfully |
| MEM-06 | Compare startup identity and SGA across repeated samples | Differences explained; no configuration changes |
| MEM-07 | Check formatting for large numbers and terminal widths | No unexplained overflow or truncation |
| MEM-08 | Check data and configuration before/after | No deliberate persistent changes attributable to scripts |

Use synthetic data in isolated VM. Never execute with pending transactions: SQL*Plus exits with rollback on errors. Check actual client exit status and output; SQL*Plus command errors may not trigger WHENEVER SQLERROR. Record date, versions, script revision, test ID, result and sanitized evidence. Do not mark passed until observed.
