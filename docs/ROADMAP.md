# Roadmap

[Deutsch](ROADMAP.de.md)

| Milestone | Release | Focus |
|---|---|---|
| M0 | 8.0.5 | Architecture, inventory, health checks, storage, sessions, locks, backup/recovery |
| M1 | 8i | STATSPACK where available, expanded diagnostics |
| M2 | 9i | RAC and administration |
| M3 | 10g | AWR/ASH/ADDM subject to licensing |
| M4 | 11g | Diagnostic improvements |
| M5 | 12c | Multitenant |
| M6 | 18c/19c | Enterprise operations |
| M7 | 21c | Release-specific additions |
| M8 | 23ai/26ai | Modern administration |

## M0 acceptance
1. Document architecture and legally obtained lab installation requirements.
2. Establish read-only inventory, storage, session and health reports.
3. Document backup and recovery drills, security baseline and troubleshooting procedures.
4. Record expected output, privileges, failure cases and source references for every script.
5. Record static review and actual execution evidence separately. If historical media are unavailable, mark runtime acceptance blocked rather than passed.

Do not start M1 until M0 has been reviewed and its remaining limitations explicitly accepted.

MySQL development may begin after Oracle8 source completion and static review even if Oracle runtime tests remain deferred. This is not runtime acceptance. See [engineering policy](ENGINEERING-POLICY.md).
