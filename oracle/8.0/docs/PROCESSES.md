# Oracle8 processes and sessions

[Deutsch](PROCESSES.de.md)

Target 8.0.5, single instance on UNIX. Runtime deferred.

## Understand
A session represents database interaction; a process executes work. SID plus SERIAL# distinguishes reused session identifiers within an instance. V$PROCESS.PID is Oracle's internal process identifier; SPID is the operating system process identifier. V$SESSION.PROCESS refers to the client, potentially on a different machine. PADDR links a session to a process state address (ADDR). Dedicated connections usually have a dedicated server process; multithreaded server configurations can share processes and change associations. Background processes are not necessarily associated with user sessions. An unmatched session or process is not proof of an orphan.

## Measure
From the repository root, in a dedicated authenticated SQL*Plus session with authorized SELECT access to the views listed in each script:
- @oracle/8.0/sql/process_inventory.sql: internal process ID, serial, server OS identifier, background flag and program.
- @oracle/8.0/sql/session_inventory.sql: session ID, serial, username, status, server mode and client process identifier.
- @oracle/8.0/sql/session_process_map.sql: session-to-process association, retaining unmatched sessions with null process fields.
- @oracle/8.0/sql/session_summary.sql: counts by status and server mode, including background sessions where present.

These are separate live observations, not an atomic snapshot. Output may contain usernames and program names. No SQL text or credentials are intentionally collected. SQL errors exit the dedicated client with rollback. Formatting or SQL*Plus command errors require output inspection.

## UNIX correlation
On the actual database host record hostname and time, then inspect a numeric server SPID with the platform's documented ps options (for example ps -p 1234 on systems supporting that option). Do not pass arbitrary database output to a shell. Verify process identity and start time where available; PIDs can be reused. A remote client's PID is not a server PID. Compare repeated observations and CPU/I/O measurements before attributing a bottleneck. ACTIVE does not establish CPU consumption and INACTIVE does not rule out held locks.

## Automate and optimize
A future class C collector must preserve instance startup identity, host, timestamps and sample interval; restrict output access and retention. Never kill a process based on a single mapping. Lock diagnosis and wait analysis are separate packages. Changes require evidence and an approved lab.

## Evidence
[Oracle8 Reference 8.0.5, chapter 3](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58242/ch3.htm), V$PROCESS and V$SESSION. View definitions are the reference; SQL*Plus formatting, outer-join behavior and runtime privileges still require testing.
[Acceptance plan](../tests/PROCESSES-ACCEPTANCE.md).
