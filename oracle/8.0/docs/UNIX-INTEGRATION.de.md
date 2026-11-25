# Oracle und UNIX

[English](UNIX-INTEGRATION.md)

## Geltungsbereich
Oracle8 8.0.5 unter historischem UNIX. Betriebssystem, Kernel, Installationslayout und unterstützte Grenzwerte bleiben bis zur Verfügbarkeit der Medien offen.

## Betriebsidentität
ORACLE_HOME (Softwarepfad), ORACLE_SID (lokale Instanzkennung), PATH und tatsächliche Programmversionen erfassen. SID ist nicht zwingend Datenbank- oder Netzwerkdienstname. Nicht die gesamte Umgebung ausgeben, da Geheimnisse enthalten sein können. Autorisierte minimale Rechte verwenden, nicht standardmäßig root.

## Zuordnung der Messwerte
| Oracle-Symptom | UNIX-Beobachtung | Interpretation |
|---|---|---|
| Langsames SQL | vmstat, sar, CPU-Warteschlange | CPU-Engpass ist zunächst eine Hypothese |
| Langsame Commits | iostat, Gerätelatenz | Redo-Ablage und Warteintervalle korrelieren |
| Pufferdruck | vmstat, Paging, Shared Memory | Größere SGA kann Speicherdruck verschärfen |
| Voller Tablespace | df, Datafile-Inventar | Logischer und physischer freier Speicher unterscheiden sich |
| Verbindungsfehler | ps, netstat, Listener-Diagnose | Listener, Anmeldung und Datenbankzustand trennen |
| Startfehler | ipcs, Limits, Alert Log | Shared-Memory-/Semaphore-Grenzen sind OS-abhängig |

ps, df, vmstat, iostat, sar, ipcs und netstat mit plattformspezifisch geeigneten Optionen nutzen. Verfügbarkeit, Einheiten und Ausgabe unterscheiden sich zwischen Solaris, AIX, HP-UX und Linux. Keine universellen Kernelwerte vorgeben.

## Messablauf
1. Zeitstempel, Host, OS und gewählte Instanz erfassen.
2. Kurze zeitlich abgestimmte Datenbank- und Host-Messungen durchführen.
3. Oracle-Prozesskennungen über geprüfte View-Spalten UNIX-Prozessen zuordnen.
4. Intervalldifferenzen, Arbeitslast und Gerätezuordnung vergleichen.
5. Bereinigte Nachweise erhalten und Unsicherheiten dokumentieren.

Diagnosewerkzeuge beenden keine Prozesse, entfernen keine IPC-Objekte, ändern keine Kernelparameter und löschen keine Archive. Dauerhafte Ausgabe ist Klasse C. Auch Messungen beeinflussen gegebenenfalls die Last.

## Quellen
Oracle8-Dokumentationsbibliothek und nach Festlegung der Plattform das passende 8.0.5-Installationshandbuch. Spätere UNIX-Handbücher liefern Anregungen, aber keinen historischen Kompatibilitätsnachweis.
