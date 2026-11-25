# oracle-dba-toolkit

[Deutsch](README.de.md)
A historically evolving Oracle DBA toolkit, starting with Oracle 8.0 and progressing through successive database generations. Includes SQL, PL/SQL, Shell and Perl scripts for administration, monitoring, performance tuning, troubleshooting, security, backup and recovery, complemented by documentation and practical DBA runbooks.

## Purpose

Develop practical database administration knowledge in chronological order, preserving the tools and constraints of each Oracle generation. Three complementary tracks guide the project: DBA fundamentals, systematic performance troubleshooting, and reusable administration and tuning scripts.

## Getting started

- [Roadmap and acceptance criteria](docs/ROADMAP.md)
- [Free learning resources and reference material](docs/SOURCES.md)
- [Oracle8 (8.0.5) workspace and lab guidance](oracle/8.0/README.md)
- [Changelog](CHANGELOG.md)
- [Contributor instructions](AGENTS.md)

## Engineering principles

Measure before tuning. Prefer read-only diagnostics, document required privileges and make operational changes reproducible. Keep release-specific SQL and scripts separate. Never assume a modern feature exists in a historical release.

Historical Oracle software is unsupported and belongs in an isolated lab with legally obtained installation media and synthetic data. No credentials or proprietary installation media may be committed. Oracle licensing, management packs and third-party code reuse require independent verification.

## Status

Initial foundation (M0). The first inventory script has not been executed against Oracle8. English is the primary documentation language. Oracle is the leading reference system. MySQL development in a separate repository may begin after the Oracle8 script baseline is complete and statically reviewed, even while Oracle runtime tests are deferred. German companion documentation is maintained in parallel.

See [MIT license](LICENSE) and [engineering policy](docs/ENGINEERING-POLICY.md). Third-party materials retain their own licenses.
