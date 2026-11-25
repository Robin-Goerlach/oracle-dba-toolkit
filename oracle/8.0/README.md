# Oracle8 (8.0.5)

[Deutsch](README.de.md)

Status: initial development; runtime testing deferred.

## Lab
Use an isolated VM with a compatible historical operating system and legally obtained Oracle media. Do not expose legacy listeners to the internet. Use synthetic data, local console access and recoverable VM snapshots. Record OS, Oracle edition, patch level and SQL*Plus version. Snapshots do not replace database backups.

## First tool
[Instance inventory](sql/instance_inventory.sql) (risk class R) queries V$VERSION and V$INSTANCE. Run from an already authenticated SQL*Plus session with authorized read privileges:
```sql
@oracle/8.0/sql/instance_inventory.sql
```
Expected: version banners and instance identity/status. An Oracle error indicates a privilege, compatibility or connection issue; do not grant DBA automatically. The script exits SQL*Plus on SQL error, so use a dedicated session.

## Next work
Storage inventory, session diagnostics, locks, redo/archive checks, backup/recovery and baseline measurements. All tools require release-specific verification.

## Architecture learning track
- [Architecture and internals](docs/ARCHITECTURE.md)
- [Oracle and UNIX integration](docs/UNIX-INTEGRATION.md)

## Memory diagnostics
- [Memory architecture and scripts](docs/MEMORY.md)
- [Deferred acceptance plan](tests/MEMORY-ACCEPTANCE.md)
