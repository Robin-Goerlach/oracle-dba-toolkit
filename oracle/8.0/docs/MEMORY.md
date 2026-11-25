# Oracle8 memory diagnostics
[Deutsch](MEMORY.de.md)

Target 8.0.5. Understand, measure, automate, optimize. Runtime validation deferred.

## Understand
The SGA is shared by Oracle processes; private process memory and sort workspaces add to host demand. Dedicated and multithreaded server configurations differ in where session state resides. Oracle8 uses manually sized components. DB_BLOCK_BUFFERS times DB_BLOCK_SIZE estimates cache payload in bytes, not total SGA. LOG_BUFFER and SHARED_POOL_SIZE are byte-valued settings. SORT_AREA_SIZE limits sort workspace; it is not a global PGA budget.

Example (synthetic): 4096 buffers of 8192 bytes represent 32 MiB of cache payload. An 8 MiB shared pool and 512 KiB redo buffer do not imply that the complete SGA is exactly 40.5 MiB: internal allocations and platform overhead matter.

## Measure
Run from the repository root in a dedicated authenticated SQL*Plus session with explicitly authorized view access:
```sql
@oracle/8.0/sql/sga_inventory.sql
@oracle/8.0/sql/sga_detail.sql
@oracle/8.0/sql/memory_parameters.sql
```
SGA inventory reports component bytes and MiB (1 MiB = 1048576 bytes), plus sum. Detail reports allocation names and bytes, without assuming modern POOL columns. Parameter report limits disclosure to a fixed allowlist; values visible to a session are not necessarily global defaults. SQL errors exit the dedicated client with rollback; output and client formatting are the only intended effects.

## Interpret
A large cache is not evidence of good performance. A small free allocation does not by itself prove a shared pool shortage. Correlate parse activity, waits, physical reads and workload. On UNIX use platform-appropriate vmstat, ipcs and process memory observations. Summing RSS across Oracle processes can double count shared pages. Avoid increasing SGA while the host is paging. Never infer an optimal size from a universal hit-ratio target.

## Automate and optimize
Future collectors must record host, instance, startup identity, timestamp, units and sampling interval. Persisted reports are class C and need restricted access and retention. Change one parameter at a time only in an approved lab, preserve the original initialization file and define a rollback and restart plan. Compare equivalent workloads and response times. No automated parameter changes in this package.

## References and evidence
- [Oracle8 Concepts A58227-01](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58227.pdf), chapter 6, especially 6-11 through 6-14.
- [Oracle8 Reference A58242-01](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58242.pdf), chapters 1 and 3, V$PARAMETER (3-62), V$SGA and V$SGASTAT (3-90).
- Memory concepts and parameter names reviewed against Release 8.0 documentation; exact view-column and SQL*Plus compatibility review remains open. No runtime evidence.
- [Deferred test plan](../tests/MEMORY-ACCEPTANCE.md).
