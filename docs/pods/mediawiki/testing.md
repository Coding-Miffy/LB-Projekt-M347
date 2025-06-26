# Testplan - MediaWiki
In diesem Abschnitt werden die geplanten Testfälle für **MediaWiki** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall | Testziel |
| :-: | :-- | :-- | :-- |
| M﻿-01 | MediaWiki | Zugriff via Ingress | Sicherstellen, dass MediaWiki über die Ingress-URL erreichbar ist |
| M﻿-02 | MediaWiki | Login mit Admin-Account | Überprüfen, ob die Authentifizierung mit bekannten Zugangsdaten funktioniert |
| M﻿-03 | MediaWiki | Seite erstellen und Pod neu starten | Testen, ob Inhalte über Pod-Neustarts erhalten bleiben |
| M﻿-04 | MediaWiki | Verbindung zur Datenbank | Sicherstellen, dass MediaWiki beim Start korrekt auf die Datenbank zugreift |
| M﻿-05 | MediaWiki | Startseite bearbeiten | Prüfen, ob Änderungen an Inhalten korrekt gespeichert und nach Neustart vorhanden sind |

# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| M-01 | Zugriff via Ingress |  |   |  |
| M-02 | Login mit Admin-Account |  |  |  |
| M-03 | Seite erstellen und Pod neu starten |  |  |  |
| M-04 | Verbindung zur Datenbank |  |  |  |
| M-05 | Startseite bearbeiten |  |  |  |

## M-01: Name
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
**Erwartetes Verhalten**:  
**Tatsächliches Verhalten**:  
**Status**: Symbol oder leer  
**Bemerkung**:  

## M-02: Name
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
**Erwartetes Verhalten**:  
**Tatsächliches Verhalten**:  
**Status**: Symbol oder leer  
**Bemerkung**:  

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
