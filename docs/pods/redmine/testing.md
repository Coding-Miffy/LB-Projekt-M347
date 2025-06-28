# Testplan - Redmine
In diesem Abschnitt werden die geplanten Testfälle für **Redmine** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr.  | Komponente | Testfall                           | Testziel                                                          |
| :--- | :--------- | :--------------------------------- | :---------------------------------------------------------------- |
| R-01 | Redmine    | Zugriff via Ingress                | Sicherstellen, dass Redmine über die Ingress-URL erreichbar ist   |
| R-02 | Redmine    | Login mit Admin-Account            | Überprüfen der Authentifizierung mit bekannten Zugangsdaten       |
| R-03 | Redmine    | Ticket erstellen und Pod neu starten| Testen, ob Tickets über Pod-Neustarts erhalten bleiben            |
| R-04 | Redmine    | Verbindung zur Datenbank           | Sicherstellen, dass Redmine beim Start korrekt auf die DB zugreift|
| R-05 | Redmine    | Startseite bearbeiten              | Prüfen, ob Änderungen an Inhalten korrekt gespeichert sind        |


# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall                   | Beschreibung                                 | Erwartetes Ergebnis              | Status |
|:---:|:---------------------------|:---------------------------------------------|:---------------------------------|:------:|
| R-01| Zugriff via Ingress        | Redmine über `redmine.m347.ch` aufrufen      | Startseite lädt korrekt          |   ✅   |
| R-02| Admin-Login                | Login: User `admin`, PW `admin123`           | Login erfolgreich                |   ✅   |
| R-03| Ticket & Pod Neustart      | Ticket erstellen, Pod löschen, neu abrufen   | Ticket bleibt erhalten           |   ✅   |
| R-04| DB-Verbindung              | Redmine-Start, Log-Check auf DB-Fehler       | Start ohne DB-Fehler             |   ✅   |
| R-05| Startseite bearbeiten      | Startseite ändern und speichern              | Änderung sichtbar                |   ✅   |

## R-01: Name
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
**Erwartetes Verhalten**:  
**Tatsächliches Verhalten**:  
**Status**: Symbol oder leer  
**Bemerkung**:  

## R-02: Name
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
