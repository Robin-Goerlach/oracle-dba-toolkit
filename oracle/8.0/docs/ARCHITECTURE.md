# Oracle8 architecture and internals

[Deutsch](ARCHITECTURE.de.md)

Target: Oracle 8.0.5, single-instance UNIX server. Documentation baseline; no runtime validation. Application development products such as HTML DB/APEX are outside M0.

## Database versus instance
The database is persistent: datafiles, control files and online redo logs. The instance is the running SGA and background processes. Stopping the instance does not erase the database. A client session is neither a database nor an instance. Oracle Parallel Server is a separate historical configuration, outside the initial single-instance scope.

Startup conceptually proceeds from NOMOUNT (instance and initialization parameters), to MOUNT (control files), to OPEN (database files available for normal access). Administrative access and available views differ by state. Never infer that a running listener means the database is open.

## Memory and processes
The SGA includes shared SQL/dictionary caches, database buffers and redo buffering. The PGA is process-private memory; session memory placement depends on connection architecture. Avoid assuming modern automatic memory management.

| Process | Operational role | Diagnostic question |
|---|---|---|
| DBWn | Writes modified database buffers | Is datafile I/O keeping up? |
| LGWR | Persists redo | Are commits delayed by redo I/O? |
| CKPT | Coordinates checkpoint bookkeeping | Is checkpoint progress adequate? |
| SMON | Instance recovery and maintenance | Is recovery in progress? |
| PMON | Cleanup after process failure | Are failed sessions leaving resources? |
| ARCH | Archives redo when configured | Is the archive destination full? |

Commit durability depends on redo persistence, not immediate writing of all changed data blocks. Rollback segments support transaction rollback and read consistency; do not use later automatic undo assumptions.

## Storage
Logical hierarchy: tablespace, segment, extent, block. Datafiles provide physical storage for tablespaces; free space inside a tablespace is not the same as free space in the UNIX filesystem. Control files record structural metadata; redo logs record changes needed for recovery. Archived redo and valid backups are essential for appropriate recovery objectives.

## Observation plan
Use version-specific dictionary and dynamic performance views. Candidate views: V$INSTANCE, V$VERSION, V$DATABASE, V$SGA, V$PROCESS, V$SESSION, V$SYSSTAT, V$SYSTEM_EVENT, DBA_DATA_FILES, DBA_FREE_SPACE. Verify columns, units and availability against 8.0.5 before implementation. Some require an open database. Counters need interval deltas and reset detection, not just absolute values.

## Engineering workflow
Understand the mechanism; measure baseline and symptoms; automate reproducible collection; optimize only after evidence. Compare before/after with comparable workload. Do not use AWR, ASH, SPFILE or multitenant assumptions in M0.

## References
- [Oracle8 8.0.5 documentation library](https://docs.oracle.com/cd/A64702_01/doc/products.htm)
- [Oracle8 Concepts, release 8.0](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58227.pdf), introduction, memory/process and storage chapters.
- [Oracle8 Concepts 8.0.4 HTML](https://docs.oracle.com/cd/A58617_01/server.804/a58227/ch_intro.htm), adjacent-release comparison only.
