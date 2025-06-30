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
| R-02| Admin-Login                | Login: User `admin`, PW `admin`           | Login erfolgreich                |   ✅   |
| R-03| Ticket & Pod Neustart      | Ticket erstellen, Pod löschen, neu abrufen   | Ticket bleibt erhalten           |   ✅   |
| R-04| DB-Verbindung              | Redmine-Start, Log-Check auf DB-Fehler       | Start ohne DB-Fehler             |   ✅   |
| R-05| Startseite bearbeiten      | Startseite ändern und speichern              | Änderung sichtbar                |   ✅   |

### Testfall R-01: Zugriff via Ingress

**Testbeschreibung:**  
Aufrufen der Redmine-Webseite über die definierte Ingress-URL.

**Testschritte:**  
1. Browser öffnen.
2. URL `http://redmine.m347.ch` eingeben.

**Erwartetes Ergebnis:**  
Die Redmine-Startseite wird korrekt geladen und ohne Fehler angezeigt.

**Tatsächliches Ergebnis:**  
Die Redmine-Startseite wurde problemlos geladen und fehlerfrei angezeigt.

| Datum       | Tester  | Status |
|-------------|---------|--------|
| 30.06.2025  | Max     | ✅ OK  |
  
### Testfall R-02: Admin-Login testen

**Testbeschreibung:**  
Prüfen, ob der Admin-Login bei Redmine funktioniert.

**Testschritte:**  
1. Browser öffnen und URL `http://redmine.m347.ch` eingeben.
2. Auf den Button **Anmelden** klicken.
3. Folgende Zugangsdaten eingeben:
   - Benutzername: `admin`
   - Passwort: `admin`
4. Auf den Button **Anmelden** klicken.

**Erwartetes Ergebnis:**  
Das Admin-Dashboard wird erfolgreich angezeigt.

**Tatsächliches Ergebnis:**  
Das Admin-Dashboard wurde erfolgreich geladen und angezeigt.

| Datum       | Tester  | Status |
|-------------|---------|--------|
| 30.06.2025  | Max     | ✅ OK  |

### Testfall R-03: Ticket erstellen und Pod-Neustart

**Testbeschreibung:**  
Prüfen, ob Tickets nach Pod-Neustart erhalten bleiben.

**Schritte:**  
1. Ticket erstellen und ID notieren.  
2. Redmine-Pod neustarten (`kubectl delete pod -l app=redmine -n m347-redmine`).  
3. Prüfen, ob Ticket erhalten blieb.

**Ergebnis:** Ticket blieb nach Neustart bestehen, keine Datenverluste.

| Datum       | Tester  | Status |
|-------------|---------|--------|
| 30.06.2025  | Max     | ✅ OK  |

---

### Testfall R-04: Verbindung zur Datenbank prüfen

**Testbeschreibung:**  
Prüfen, ob Redmine nach Pod-Neustart weiterhin auf die Datenbank zugreifen kann.

**Schritte:**  
1. Redmine-Pod löschen (`kubectl delete pod -l app=redmine -n m347-redmine`).  
2. Neustart prüfen und Logs kontrollieren (`kubectl logs -l app=redmine -n m347-redmine`).  

**Ergebnis:** Keine DB-Verbindungsfehler, Redmine startet fehlerfrei.

| Datum       | Tester  | Status |
|-------------|---------|--------|
| 30.06.2025  | Max     | ✅ OK  |


## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
