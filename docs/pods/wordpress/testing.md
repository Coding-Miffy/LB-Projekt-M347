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
| W-03| Beitrag erstellen, Pod neu starten | Beitrag erstellen, Pod löschen, neu abrufen | Beitrag bleibt erhalten |   ✅   |
| W-04| Verbindung zur Datenbank   | WP starten, Logs auf Fehler prüfen          | Keine DB-Fehler beim Start   |   ✅   |
| W-05| Startseite bearbeiten      | Text ergänzen und speichern                 | Änderungen sichtbar          |   ✅   |

### Testfall W-01: Zugriff via Ingress

**Testbeschreibung:**  
Prüfen, ob WordPress via Ingress erreichbar ist.

**Testschritte:**  
1. WordPress-Seite im Browser aufrufen:
   ```
   http://wordpress.m347.ch
   ```

**Erwartetes Ergebnis:**  
Die WordPress-Startseite wird geladen und fehlerfrei angezeigt.

**Tatsächliches Ergebnis:**  
Die Startseite wurde erfolgreich geladen und angezeigt.  

| Datum       | Tester  | Status |
|-------------|---------|--------|
| 30.06.2025  | Max     | ✅ OK  |

### Testfall W-02: Login mit Admin-Account

**Testbeschreibung:**  
Es wird geprüft, ob der Admin-Login in WordPress korrekt funktioniert.

**Testschritte:**  
1. Admin-Loginseite im Browser öffnen:
   ```
   http://wordpress.m347.ch/wp-admin
   ```
2. Admin-Zugangsdaten eingeben und anmelden.

**Erwartetes Ergebnis:**  
WordPress-Admin-Dashboard erscheint nach erfolgreichem Login.

**Tatsächliches Ergebnis:**  
Admin-Login erfolgreich, Dashboard wurde angezeigt.

| Datum       | Tester | Status |
|-------------|--------|--------|
| 30.06.2025  | Max    | ✅ OK  |

### Testfall W-03: Beitrag erstellen und Pod-Neustart

**Testbeschreibung:**  
Prüfen, ob in WordPress erstellte Beiträge nach einem Pod-Neustart erhalten bleiben (Persistenztest).

**Testschritte:**  

1. Neuen Beitrag im WordPress-Dashboard erstellen und veröffentlichen.
2. Beitragstitel bzw. URL notieren.
3. Pod löschen, um Neustart zu erzwingen:
   ```powershell
   kubectl delete pod -l app=wordpress -n m347-wordpress
   kubectl get pods -n m347-wordpress
   ```
4. Webseite neu laden und prüfen, ob der Beitrag noch vorhanden ist.

**Erwartetes Ergebnis:**  
Der Beitrag bleibt nach Pod-Neustart unverändert bestehen.

**Tatsächliches Ergebnis:**  
Beitrag blieb nach Neustart unverändert erhalten.

| Datum       | Tester | Status |
|-------------|--------|--------|
| 30.06.2025  | Max    | ✅ OK  |

### Testfall W-04: Verbindung zur Datenbank prüfen

**Testbeschreibung:**  
Prüfen, ob WordPress nach einem Pod-Neustart weiterhin problemlos auf die MariaDB-Datenbank zugreift.

**Testschritte:**  

1. WordPress-Pod löschen, um Neustart zu erzwingen:
   ```powershell
   kubectl delete pod -l app=wordpress -n m347-wordpress
   ```
2. Logs prüfen auf Datenbank-Verbindungsfehler:
   ```powershell
   kubectl logs -l app=wordpress -n m347-wordpress
   ```

**Erwartetes Ergebnis:**  
Keine Datenbank-Verbindungsfehler, WordPress startet ohne Probleme.

**Tatsächliches Ergebnis:**  
WordPress startete problemlos ohne Datenbankfehler.

| Datum       | Tester | Status |
|-------------|--------|--------|
| 30.06.2025  | Max    | ✅ OK  |

### Testfall W-05: Startseite bearbeiten

**Testbeschreibung:**  
Es wird geprüft, ob Änderungen an der WordPress-Startseite korrekt gespeichert werden.

**Testschritte:**  

1. Im WordPress-Admin anmelden (`http://wordpress.m347.ch/wp-admin`).
2. Startseite bearbeiten (Titel oder Inhalt ändern).
3. Änderungen speichern und die Webseite neu laden.

**Erwartetes Ergebnis:**  
Änderungen werden dauerhaft gespeichert und korrekt angezeigt.

**Tatsächliches Ergebnis:**  
Änderungen wurden erfolgreich gespeichert und korrekt angezeigt.

| Datum       | Tester | Status |
|-------------|--------|--------|
| 30.06.2025  | Max    | ✅ OK  |


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
