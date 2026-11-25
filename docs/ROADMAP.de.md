# Entwicklungsplan

[English](ROADMAP.md)

| Meilenstein | Version | Schwerpunkt |
|---|---|---|
| M0 | 8.0.5 | Architektur, Inventar, Health Checks, Speicher, Sessions, Locks, Backup und Recovery |
| M1 | 8i | STATSPACK soweit verfügbar, erweiterte Diagnose |
| M2 | 9i | RAC und Administration |
| M3 | 10g | AWR/ASH/ADDM unter Lizenzvorbehalt |
| M4 | 11g | Diagnoseerweiterungen |
| M5 | 12c | Multitenant |
| M6 | 18c/19c | Enterprise-Betrieb |
| M7 | 21c | Versionsspezifische Erweiterungen |
| M8 | 23ai/26ai | Moderne Administration |

## M0-Abnahme
Architektur und Laboranforderungen dokumentieren; Inventar-, Speicher-, Session- und Health-Reports implementieren; Backup/Recovery, Sicherheit und Runbooks beschreiben; Rechte, Ausgabe, Fehlerfälle und Quellen je Skript erfassen. Statische Prüfung und Laufzeittest getrennt dokumentieren.

Nach Fertigstellung und statischer Prüfung der Oracle8-Basis kann MySQL parallel beginnen. Oracle8-Laufzeitabnahme bleibt offen. Vor dem Übergang zu M1 sind verbleibende Einschränkungen ausdrücklich zu akzeptieren.
