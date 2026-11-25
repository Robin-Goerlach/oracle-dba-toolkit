# Process and session acceptance

[Deutsch](PROCESSES-ACCEPTANCE.de.md)

All runtime cases NOT RUN / DEFERRED. Record exact server/client version, host, revision, timestamp and sanitized output.

| ID | Case | Expected |
|---|---|---|
| PS-01 | Authorized process and session reports | Columns resolve and rows are readable |
| PS-02 | Two dedicated sessions | Distinct session identities; correlate server SPID on database host |
| PS-03 | Remote client | Client PID not mistaken for server SPID |
| PS-04 | Session without matching process, if observable | Session retained, process fields null |
| PS-05 | Multithreaded server, if available | Shared or changing mapping interpreted correctly |
| PS-06 | Session summary with stable workload | Counts consistent within observation limits |
| PS-07 | Missing SELECT permission | SQL error and unsuccessful client exit |
| PS-08 | Session disconnect/reconnect | Reused SID or PID not treated as same identity |
| PS-09 | Check persistent state before/after | No deliberate database or configuration changes |

Do not force process failure to create PS-04. Mark unavailable scenarios blocked. Use isolated synthetic lab and dedicated SQL*Plus sessions. Inspect output as well as exit status.
