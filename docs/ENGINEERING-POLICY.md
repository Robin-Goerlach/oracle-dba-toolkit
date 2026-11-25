# Engineering policy

[Deutsch](ENGINEERING-POLICY.de.md)

## Reference system
Oracle is the leading system for the functional requirements, operational concepts and diagnostic methodology. Oracle 8.0.5 is the first historical baseline. Once the Oracle8 script baseline is implemented and statically reviewed, a separate MySQL toolkit may begin, even if Oracle runtime validation remains pending. Adapt concepts to the target engine rather than translating SQL blindly. MySQL tests do not establish Oracle compatibility.

## Development
Work directly on main; preserve existing changes and avoid force pushes. English is canonical; maintain German companion documents using the .de.md suffix. Original project contributions use MIT; third-party materials retain their own licenses.

## Safety classification
| Class | Meaning |
|---|---|
| R | Read-only database diagnostics; no deliberate persistent database or configuration changes |
| C | Collection with persistent output, including files or monitoring tables; document destination, retention and overhead |
| M | Administrative changes; document preconditions, impact and rollback |
| D | Destructive or disruptive operations; require explicit authorization and recovery planning |

Use R by default for diagnosis. Class R is not a guarantee of zero workload or zero sensitive output. A script with multiple effects must disclose all of them and use the highest applicable risk class. Client settings alone do not constitute database changes. Avoid unnecessary privileges. M and D scripts must not be executed automatically against production.

## Validation
Track implementation, static review, and runtime validation independently. Static review must check the exact release documentation, SQL*Plus syntax, privileges, expected output, side effects and failure behavior. Runtime status remains NOT RUN / DEFERRED until a real compatible instance is available. Do not claim production readiness or successful execution without evidence. Historical test systems must remain isolated. Use legally obtained media and synthetic data.

A source-complete Oracle8 baseline can be accepted for continued development without runtime acceptance. Document the deferred test debt and preserve the test plan. No later engine can close that debt.
