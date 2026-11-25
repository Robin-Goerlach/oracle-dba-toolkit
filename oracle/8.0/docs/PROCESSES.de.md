# Oracle8-Prozesse und Sitzungen

[English](PROCESSES.md)

Ziel 8.0.5, Einzelinstanz unter UNIX. Laufzeitprüfung zurückgestellt.

## Verstehen
Eine Session repräsentiert eine Datenbankinteraktion, ein Prozess führt Arbeit aus. SID und SERIAL# unterscheiden wiederverwendete Sitzungskennungen innerhalb einer Instanz. V$PROCESS.PID ist die interne Oracle-Prozesskennung, SPID die Betriebssystemkennung. V$SESSION.PROCESS bezeichnet den Client, möglicherweise auf einem anderen Rechner. PADDR verweist auf die Prozessadresse ADDR. Dedicated Server bedienen üblicherweise eine Verbindung exklusiv; Multithreaded Server können Prozesse teilen und Zuordnungen wechseln. Hintergrundprozesse benötigen keine Benutzersitzung. Eine fehlende Zuordnung beweist keinen verwaisten Prozess.

## Messen
Aus dem Repository-Wurzelverzeichnis in einer eigenen authentifizierten SQL*Plus-Sitzung mit autorisierten Leserechten auf die jeweils angegebenen Sichten:
- @oracle/8.0/sql/process_inventory.sql: interne Prozesskennung, Seriennummer, serverseitige OS-Kennung, Hintergrundkennzeichen und Programm.
- @oracle/8.0/sql/session_inventory.sql: Sessionkennung, Seriennummer, Benutzer, Status, Servermodus und Clientprozess.
- @oracle/8.0/sql/session_process_map.sql: Zuordnung Sitzung zu Prozess, fehlende Zuordnungen bleiben mit NULL-Prozessfeldern sichtbar.
- @oracle/8.0/sql/session_summary.sql: Anzahl nach Status und Servermodus, einschließlich vorhandener Hintergrundsitzungen.

Getrennte Live-Beobachtungen, kein atomarer Snapshot. Ausgabe kann Benutzernamen und Programmnamen enthalten. SQL-Text und Zugangsdaten werden nicht gezielt erfasst. SQL-Fehler beenden den separaten Client mit Rollback. Formatierungs- und SQL*Plus-Kommandofehler anhand der Ausgabe prüfen.

## UNIX-Korrelation
Auf dem tatsächlichen Datenbankhost Hostname und Zeit erfassen, dann numerische serverseitige SPID mit dokumentierten ps-Optionen untersuchen (beispielsweise ps -p 1234 auf geeigneten Systemen). Keine beliebigen Datenbankausgaben an eine Shell übergeben. Prozessidentität und möglichst Startzeit prüfen; PIDs können wiederverwendet werden. Eine entfernte Client-PID ist keine Server-PID. Wiederholte Beobachtungen und CPU-/I/O-Messwerte vergleichen. ACTIVE beweist keinen CPU-Verbrauch, INACTIVE schließt gehaltene Locks nicht aus.

## Automatisieren und optimieren
Ein künftiger Sammler der Klasse C muss Instanzstartidentität, Host, Zeitstempel und Messintervall erhalten; Ausgabezugriff und Aufbewahrung begrenzen. Keine Prozesse aufgrund einer einzelnen Zuordnung beenden. Lock- und Wartezeitanalyse folgen separat. Änderungen benötigen Messnachweise und ein freigegebenes Labor.

## Nachweise
[Oracle8 Reference 8.0.5, Kapitel 3](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58242/ch3.htm), V$PROCESS und V$SESSION. View-Definitionen dienen als Referenz; SQL*Plus-Formatierung, Outer Join und tatsächliche Rechte müssen noch getestet werden.
[Abnahmeplan](../tests/PROCESSES-ACCEPTANCE.de.md).
