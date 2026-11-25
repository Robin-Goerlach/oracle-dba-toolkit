# Abnahme Speicherdiagnose
[English](MEMORY-ACCEPTANCE.md)

Status: implementiert; statische Prüfung teilweise; Laufzeit NOT RUN / DEFERRED.

| ID | Prüfung | Erwartung |
|---|---|---|
| MEM-01 | Server/Client 8.0.5, Plattform und Edition erfassen | Exakte Versionen dokumentiert |
| MEM-02 | SGA-Inventar mit Leserechten | Nichtnegative Werte, Summe stimmt |
| MEM-03 | Detailbericht | Namen und Bytes, absteigend nach Bytes |
| MEM-04 | Parameterbericht | Nur Positivliste, fehlende Einträge untersuchen |
| MEM-05 | Konto ohne View-Zugriff | SQL-Fehler, erfolgloser Client-Exit |
| MEM-06 | Wiederholte Messung und Startidentität | Unterschiede erklärt, keine Konfigurationsänderung |
| MEM-07 | Große Zahlen und Terminalbreite | Keine unerklärten Überläufe oder Kürzungen |
| MEM-08 | Daten und Konfiguration vor/nach Ausführung | Keine beabsichtigten dauerhaften Skriptänderungen |

Isolierte VM, synthetische Daten. Keine offenen Transaktionen: Fehler führen zum Client-Exit mit Rollback. Exitstatus und Ausgabe prüfen; SQL*Plus-Kommandofehler lösen WHENEVER SQLERROR nicht zwingend aus. Datum, Versionen, Skriptrevision, Test-ID, Ergebnis und bereinigte Nachweise erfassen. Ohne Beobachtung kein PASS.
