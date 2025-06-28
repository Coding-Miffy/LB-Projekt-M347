# Testplan - WordPress
In diesem Abschnitt werden die geplanten Testfälle für **WordPress** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall                   | Testziel                                 |
|:---:|:-----------|:---------------------------|:-----------------------------------------|
| W-01| WordPress  | Zugriff via Ingress        | WP über Ingress-URL erreichbar           |
| W-02| WordPress  | Login mit Admin-Account    | Authentifizierung funktioniert korrekt   |
| W-03| WordPress  | Beitrag erstellen, Pod neu starten | Inhalte bleiben nach Neustart erhalten   |
| W-04| WordPress  | Verbindung zur Datenbank   | WP verbindet sich erfolgreich zur DB     |
| W-05| WordPress  | Startseite bearbeiten      | Änderungen an Inhalten werden gespeichert|


# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall                   | Beschreibung                                | Erwartetes Ergebnis          | Status |
|:---:|:---------------------------|:--------------------------------------------|:-----------------------------|:------:|
| W-01| Zugriff via Ingress        | WP über `wordpress.m347.ch` aufrufen        | Startseite lädt erfolgreich  |   ✅   |
| W-02| Login mit Admin-Account    | Einloggen mit bekannten Zugangsdaten        | Dashboard erscheint korrekt  |   ✅   |
| W-03| Beitrag erstellen, Pod neu starten | Beitrag erstellen, Pod löschen, neu abrufen | Beitrag bleibt erhalten |   ⚠️   |
| W-04| Verbindung zur Datenbank   | WP starten, Logs auf Fehler prüfen          | Keine DB-Fehler beim Start   |   ✅   |
| W-05| Startseite bearbeiten      | Text ergänzen und speichern                 | Änderungen sichtbar          |   ✅   |



## W-01: Name
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
**Erwartetes Verhalten**:  
**Tatsächliches Verhalten**:  
**Status**: Symbol oder leer  
**Bemerkung**:  

## W-02: Name
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
