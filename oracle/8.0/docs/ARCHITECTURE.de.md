# Oracle8-Architektur und Internals

[English](ARCHITECTURE.md)

Ziel: Oracle 8.0.5, Einzelinstanz unter UNIX. Dokumentationsgrundlage, keine Laufzeitvalidierung. HTML DB/APEX und Anwendungsentwicklung gehören nicht zu M0.

## Datenbank und Instanz
Die Datenbank besteht dauerhaft aus Datafiles, Control Files und Online Redo Logs. Die Instanz besteht aus laufender SGA und Hintergrundprozessen. Das Beenden der Instanz löscht die Datenbank nicht. Eine Clientsitzung ist weder Datenbank noch Instanz. Oracle Parallel Server bleibt zunächst außerhalb des Einzelinstanz-Szenarios.

Beim Start folgt konzeptionell NOMOUNT (Instanz und Initialisierungsparameter), MOUNT (Control Files) und OPEN (Datenbankdateien für reguläre Zugriffe verfügbar). Die verfügbaren Sichten und administrativen Zugriffe unterscheiden sich je Zustand. Ein laufender Listener beweist keine geöffnete Datenbank.

## Speicher und Prozesse
Die SGA enthält unter anderem gemeinsam genutzte SQL- und Dictionary-Caches, Datenbankpuffer und Redo-Puffer. Die PGA ist prozessprivater Speicher; die Platzierung von Sitzungsspeicher hängt von der Verbindungsarchitektur ab. Moderne automatische Speicherverwaltung nicht voraussetzen.

| Prozess | Aufgabe | Diagnosefrage |
|---|---|---|
| DBWn | Geänderte Datenblöcke schreiben | Reicht der Datafile-I/O-Durchsatz? |
| LGWR | Redo dauerhaft speichern | Verzögert Redo-I/O Commits? |
| CKPT | Checkpoint-Verwaltung koordinieren | Schreiten Checkpoints ausreichend voran? |
| SMON | Instanz-Recovery und Wartung | Läuft eine Wiederherstellung? |
| PMON | Nach Prozessfehlern aufräumen | Bleiben Ressourcen fehlgeschlagener Sitzungen zurück? |
| ARCH | Redo bei entsprechender Konfiguration archivieren | Ist das Archivziel voll? |

Commit-Dauerhaftigkeit beruht auf dem Schreiben von Redo, nicht auf sofortigem Schreiben sämtlicher geänderter Datenblöcke. Rollback-Segmente dienen Transaktionsrücknahme und Lesekonsistenz; spätere automatische Undo-Verwaltung nicht voraussetzen.

## Speicherstrukturen
Logische Hierarchie: Tablespace, Segment, Extent, Block. Datafiles bilden den physischen Speicher der Tablespaces. Freier Tablespace-Speicher ist nicht dasselbe wie freier UNIX-Dateisystemspeicher. Control Files enthalten Strukturinformationen; Redo protokolliert Änderungen für Recovery. Archiviertes Redo und gültige Backups sind für entsprechende Wiederherstellungsziele entscheidend.

## Messplan
Kandidaten: V$INSTANCE, V$VERSION, V$DATABASE, V$SGA, V$PROCESS, V$SESSION, V$SYSSTAT, V$SYSTEM_EVENT, DBA_DATA_FILES, DBA_FREE_SPACE. Spalten, Einheiten und Verfügbarkeit vor Implementierung gegen 8.0.5 prüfen. Einige Sichten benötigen eine geöffnete Datenbank. Zähler als Intervalldifferenzen mit Reset-Erkennung auswerten.

## Methodik
Erst verstehen, dann messen, dann automatisieren und schließlich optimieren. Vorher/Nachher bei vergleichbarer Last messen. AWR, ASH, SPFILE und Multitenant nicht für M0 voraussetzen.

## Quellen
[Oracle8-Dokumentation 8.0.5](https://docs.oracle.com/cd/A64702_01/doc/products.htm), [Oracle8 Concepts](https://docs.oracle.com/cd/A64702_01/doc/server.805/a58227.pdf), [8.0.4 HTML zum Versionsvergleich](https://docs.oracle.com/cd/A58617_01/server.804/a58227/ch_intro.htm).
