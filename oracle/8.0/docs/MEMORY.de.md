# Oracle8-Speicherdiagnose
[English](MEMORY.md)

Ziel 8.0.5. Erst verstehen, dann messen, dann automatisieren und schließlich optimieren. Laufzeittests zurückgestellt.

## Verstehen
Oracle-Prozesse teilen die SGA. Privater Prozessspeicher und Sortierbereiche erhöhen den Speicherbedarf des Hosts. Dedicated Server und Multithreaded Server unterscheiden sich in der Ablage des Sitzungszustands. Oracle8 verwendet manuell dimensionierte Komponenten. DB_BLOCK_BUFFERS mal DB_BLOCK_SIZE ergibt die Puffer-Nutzkapazität in Bytes, nicht die gesamte SGA. LOG_BUFFER und SHARED_POOL_SIZE sind Bytewerte. SORT_AREA_SIZE begrenzt einen Sortierbereich und ist kein globales PGA-Budget.

Synthetisches Beispiel: 4096 Puffer zu 8192 Bytes entsprechen 32 MiB. Zusammen mit 8 MiB Shared Pool und 512 KiB Redo-Puffer ergibt sich nicht zwingend eine Gesamt-SGA von 40,5 MiB; interne und plattformabhängige Zusatzbelegungen sind zu berücksichtigen.

## Messen
Aus dem Repository-Wurzelverzeichnis in einer eigenen authentifizierten SQL*Plus-Sitzung mit autorisierten Leserechten:
```sql
@oracle/8.0/sql/sga_inventory.sql
@oracle/8.0/sql/sga_detail.sql
@oracle/8.0/sql/memory_parameters.sql
```
Das Inventar zeigt Komponenten und Summe in Bytes und MiB (1 MiB = 1048576 Bytes). Details zeigen Belegungsnamen und Bytes ohne moderne POOL-Spalten vorauszusetzen. Die Parameterabfrage nutzt eine feste Positivliste; Sitzungswerte sind nicht zwingend globale Standardwerte. Bei SQL-Fehlern beendet sich der separate Client mit Rollback. Beabsichtigt sind nur Ausgabe und Clientformatierung.

## Interpretieren
Ein großer Cache beweist keine gute Performance. Wenig freie Belegung allein beweist keinen Shared-Pool-Mangel. Parse-Aktivität, Wartezeiten, physische Lesezugriffe und Arbeitslast gemeinsam betrachten. Unter UNIX vmstat, ipcs und Prozessspeicher plattformspezifisch auswerten. Die Summe der RSS-Werte kann gemeinsam genutzte Seiten mehrfach zählen. Bei Paging die SGA nicht unüberlegt vergrößern. Keine universelle Cache-Trefferquote als Tuningziel.

## Automatisieren und optimieren
Künftige Sammler erfassen Host, Instanz, Startidentität, Zeitstempel, Einheiten und Messintervall. Gespeicherte Berichte sind Klasse C und benötigen Zugriffsschutz und Aufbewahrungsregeln. Parameter einzeln im freigegebenen Labor ändern, ursprüngliche Initialisierungsdatei sichern und Rücknahme samt Neustart planen. Vergleichbare Last und Antwortzeiten messen. Keine automatischen Parameteränderungen in diesem Paket.

## Quellen und Nachweise
[Oracle8 Concepts A58227-01](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58227.pdf), Kapitel 6, besonders 6-11 bis 6-14; [Oracle8 Reference A58242-01](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58242.pdf), Kapitel 1 und 3, V$PARAMETER (3-62), V$SGA/V$SGASTAT (3-90).
Speicherkonzepte und Parameternamen gegen Release 8.0 geprüft; genaue Spalten- und SQL*Plus-Prüfung steht aus. Keine Laufzeitnachweise.
[Zurückgestellter Testplan](../tests/MEMORY-ACCEPTANCE.de.md).
