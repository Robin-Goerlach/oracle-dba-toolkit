# Abnahme Prozesse und Sitzungen

[English](PROCESSES-ACCEPTANCE.md)

Alle Laufzeitfälle NOT RUN / DEFERRED. Exakte Server-/Clientversion, Host, Revision, Zeit und bereinigte Ausgabe erfassen.

| ID | Fall | Erwartung |
|---|---|---|
| PS-01 | Autorisierte Prozess- und Sessionberichte | Spalten vorhanden, lesbare Zeilen |
| PS-02 | Zwei Dedicated Sessions | Unterschiedliche Sessionidentitäten; Server-SPID am Datenbankhost zuordnen |
| PS-03 | Entfernter Client | Client-PID nicht mit Server-SPID verwechselt |
| PS-04 | Session ohne passenden Prozess, falls beobachtbar | Session erhalten, Prozessfelder NULL |
| PS-05 | Multithreaded Server, falls verfügbar | Geteilte oder wechselnde Zuordnung richtig interpretiert |
| PS-06 | Sessionübersicht bei stabiler Last | Anzahl im Rahmen der Beobachtungsgrenzen konsistent |
| PS-07 | Fehlendes SELECT-Recht | SQL-Fehler, erfolgloser Client-Exit |
| PS-08 | Session trennen und neu verbinden | Wiederverwendete SID/PID nicht als gleiche Identität gewertet |
| PS-09 | Persistenten Zustand vorher/nachher prüfen | Keine beabsichtigten Datenbank- oder Konfigurationsänderungen |

Keine Prozessfehler für PS-04 erzwingen. Nicht verfügbare Szenarien als blockiert kennzeichnen. Isoliertes Labor, synthetische Daten und eigene SQL*Plus-Sitzungen. Ausgabe und Exitstatus prüfen.
