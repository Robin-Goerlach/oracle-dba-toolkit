# Entwicklungsgrundsätze

[English](ENGINEERING-POLICY.md)

## Referenzsystem
Oracle ist das führende System für fachliche Anforderungen, Betriebsverfahren und Diagnosemethodik. Oracle 8.0.5 ist die erste historische Referenz. Sobald die Oracle8-Skriptbasis implementiert und statisch geprüft ist, darf ein separates MySQL-Toolkit beginnen, auch wenn Oracle-Laufzeittests noch ausstehen. Konzepte werden an das Zielsystem angepasst, nicht blind als SQL übersetzt. MySQL-Tests belegen keine Oracle-Kompatibilität.

## Entwicklung
Direkt in main arbeiten, bestehende Änderungen erhalten, keine Force-Pushes. Englisch ist maßgeblich; deutsche Paralleldokumente erhalten die Endung .de.md. Eigene Projektbeiträge stehen unter MIT, Fremdmaterial behält seine eigene Lizenz.

## Sicherheitsklassen
| Klasse | Bedeutung |
|---|---|
| R | Lesende Datenbankdiagnose ohne beabsichtigte dauerhafte Änderungen an Datenbank oder Konfiguration |
| C | Messwerterfassung mit dauerhafter Ausgabe in Dateien oder Monitoringtabellen; Ziel, Aufbewahrung und Last dokumentieren |
| M | Administrative Änderungen; Voraussetzungen, Auswirkungen und Rücknahme dokumentieren |
| D | Destruktive oder betriebsunterbrechende Operationen; ausdrückliche Freigabe und Wiederherstellungsplanung erforderlich |

Diagnosen verwenden standardmäßig R. Auch Lesezugriffe können Last erzeugen und sensible Informationen offenlegen. Bei mehreren Auswirkungen gilt die höchste zutreffende Risikoklasse; alle Auswirkungen sind zu dokumentieren. Reine Client-Einstellungen sind keine Datenbankänderung. Unnötige Privilegien vermeiden. M und D nicht automatisch auf Produktivsystemen ausführen.

## Validierung
Implementierung, statische Prüfung und Laufzeittest getrennt erfassen. Die statische Prüfung berücksichtigt versionsgenaue Dokumentation, SQL*Plus-Syntax, Rechte, erwartete Ausgabe, Nebenwirkungen und Fehlerverhalten. Laufzeitstatus bleibt NOT RUN / DEFERRED, bis eine passende Instanz verfügbar ist. Keine behauptete Produktionsreife ohne Nachweis. Historische Testsysteme isolieren; rechtmäßig beschaffte Medien und synthetische Daten verwenden.

Eine im Quelltext fertiggestellte Oracle8-Basis darf für die weitere Entwicklung abgenommen werden, ohne eine Laufzeitabnahme vorzutäuschen. Testschuld und Testplan bleiben dokumentiert. Tests anderer Datenbanksysteme ersetzen diese nicht.
