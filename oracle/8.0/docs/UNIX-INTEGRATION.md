# Oracle and UNIX

[Deutsch](UNIX-INTEGRATION.de.md)

## Scope
Oracle8 8.0.5 on a historical UNIX platform. Exact operating system, kernel, installation layout and supported limits remain unknown until media are available.

## Operational identity
Record ORACLE_HOME (software location), ORACLE_SID (local instance identifier), PATH and actual executable versions. SID is not necessarily the database name or network service name. Do not dump the complete environment because it may contain secrets. Run diagnostics as an authorized low-privilege account; do not default to root.

## Correlation map
| Oracle symptom | UNIX observation | Interpretation |
|---|---|---|
| Slow SQL | vmstat, sar, CPU run queue | CPU contention is a hypothesis, not proof |
| Slow commits | iostat, device latency | Correlate redo placement and wait intervals |
| Buffer pressure | vmstat, paging, shared memory | More SGA can worsen host memory pressure |
| Full tablespace | df, datafile inventory | Logical free space differs from filesystem capacity |
| Connection failure | ps, netstat, listener diagnostics | Separate listener, authentication and database state |
| Startup failure | ipcs, limits, alert log | Shared memory/semaphore limits depend on OS |

Use ps, df, vmstat, iostat, sar, ipcs and netstat only with platform-appropriate options. Availability, units and output format differ across Solaris, AIX, HP-UX and Linux. Do not prescribe universal kernel values.

## Collection sequence
1. Record timestamp, host, OS and selected instance.
2. Collect short database and host observation intervals with matching timestamps.
3. Map Oracle process identifiers to UNIX processes using validated view columns.
4. Compare interval changes, workload and relevant device mappings.
5. Preserve sanitized evidence and document uncertainty.

No killing processes, removing IPC objects, changing kernel settings or deleting archive files in diagnostic tools. Collecting output to disk is class C. The measurement itself may affect workload.

## Source policy
Use the Oracle8 documentation library and the platform-specific 8.0.5 installation guide once the platform is known. Later UNIX guides can suggest questions, not certify historical commands.
