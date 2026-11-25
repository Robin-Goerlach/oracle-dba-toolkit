# Oracle8 (8.0.5)

[English](README.md)

Status: Entwicklung begonnen; Laufzeitprüfung zurückgestellt.

## Labor
Isolierte VM, kompatibles historisches Betriebssystem und rechtmäßig beschaffte Oracle-Medien. Keine öffentliche Listener-Freigabe. Synthetische Daten verwenden; Betriebssystem, Edition, Patchstand und SQL*Plus-Version dokumentieren. VM-Snapshots ersetzen kein Datenbankbackup.

## Erstes Werkzeug
[Instanzinventar](sql/instance_inventory.sql), Klasse R. In einer eigenen bereits authentifizierten SQL*Plus-Sitzung mit autorisierten Leserechten ausführen:

```sql
@oracle/8.0/sql/instance_inventory.sql
```

Erwartet werden Versionsinformationen sowie Instanzidentität und Status. Bei SQL-Fehlern beendet das Skript SQL*Plus. Fehlerursache prüfen, nicht automatisch DBA-Rechte vergeben.

Weitere Arbeit: Speicher, Sessions, Locks, Redo/Archive, Backup/Recovery und Baseline-Messungen. Laufzeittests bleiben offen.

## Architektur-Lernpfad
- [Architektur und Internals](docs/ARCHITECTURE.de.md)
- [Oracle und UNIX](docs/UNIX-INTEGRATION.de.md)

## Speicherdiagnose
- [Speicherarchitektur und Skripte](docs/MEMORY.de.md)
- [Zurückgestellter Abnahmeplan](tests/MEMORY-ACCEPTANCE.de.md)
