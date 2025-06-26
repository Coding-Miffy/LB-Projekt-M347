# Testplan - MediaWiki
In diesem Abschnitt werden die geplanten Testfälle für **MediaWiki** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall | Testziel |
| :-: | :-- | :-- | :-- |
| M﻿-01 | MediaWiki | Zugriff via Ingress | Sicherstellen, dass MediaWiki über die Ingress-URL erreichbar ist |
| M﻿-02 | MediaWiki | Login mit Admin-Account | Überprüfen, ob die Authentifizierung mit bekannten Zugangsdaten funktioniert |
| M﻿-03 | MediaWiki | Seite erstellen und Pod neu starten | Testen, ob Inhalte über Pod-Neustarts erhalten bleiben |
| M﻿-04 | MediaWiki | Verbindung zur Datenbank | Sicherstellen, dass MediaWiki beim Start korrekt auf die Datenbank zugreift |
| M﻿-05 | MediaWiki | Startseite bearbeiten | Prüfen, ob Änderungen an Inhalten korrekt gespeichert sind |

# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| M﻿-01 | Zugriff via Ingress | MediaWiki im Browser über Hostnamen `mediawiki.m347.ch` aufrufen | Startseite wird erfolgreich geladen | ✅ |
| M﻿-02 | Login mit Admin-Account | Mit Benutzer `mwuser` und Passwort `supergeheim` einloggen | Login erfolgreich, Benutzeroberfläche erscheint | ✅ |
| M﻿-03 | Seite erstellen und Pod neu starten | Seite *TestPersistenz* erstellen, Pod löschen, erneut abrufen | Seite bleibt erhalten | ⚠️ |
| M﻿-04 | Verbindung zur Datenbank | MediaWiki starten, prüfen ob keine DB-Fehler erscheinen | Start erfolgt ohne Fehlermeldung | ✅ |
| M﻿-05 | Startseite bearbeiten | Text auf der Startseite ergänzen und speichern | Änderung ist sichtbar | ✅ |

## M-01: Zugriff via Ingress
**Testdatum**: 26.06.2025  
**Tester:in**: Natascha Blumer  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
1. MediaWiki im Browser über `http://mediawiki.m347.ch` aufrufen.
   
**Erwartetes Verhalten**: 
- Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:
- Startseite erscheint ohne Fehlermeldung.

**Status**: ✅   
**Bemerkung**: *Keine*  

## M-02: Login mit Admin-Account
**Testdatum**: 26.06.2025  
**Tester:in**: Natascha Blumer  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. MediaWiki läuft im Browser.  
**Beschreibung**:  
1. In der Navigationsleiste auf `Anmelden` klicken.
2. Die Logindaten eingeben:

   ```txt
   Benutzername: mwuser
   Passwort: supergeheim
   ```
3. Auf die Schaltfläche `Anmelden` klicken.

**Erwartetes Verhalten**: 
- Benutzer wird erfolgreich eingeloggt.

**Tatsächliches Verhalten**:
- Benutzer wird erfolgreich eingeloggt.

**Status**: ✅  
**Bemerkung**: *Keine*  

## M-03: Seite erstellen und Pod neu starten
**Testdatum**: 26.06.2025  
**Tester:in**: Natascha Blumer  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. MediaWiki läuft im Browser und der Benutzer ist eingeloggt.  
**Beschreibung**:  
1. Im Suchfeld `TestPersistenz` eingeben und bestätigen.
2. Es werden keine Ergebnisse gefunden. Auf die Schaltfläche `Erstelle die Seite "TestPersistenz" in diesem Wiki` klicken.
3. Der Seite etwas Text hinzufügen und anschliessend auf die Schaltfläche `Seite speichern` klicken.
4. Die MediaWiki-Pods löschen:

   ```powershell
   kubectl delete pod -l app=mediawiki -n m347-mediawiki
   kubectl delete pod -l app=mariadb -n m347-mediawiki
   ```

5. Warten bis die Pods wieder gestartet sind:

   ```powershell
   kubectl get pods -n m347-mediawiki
   ```

6. MediaWiki im Browser aufrufen und nach der Seite `TestPersistenz` suchen.

**Erwartetes Verhalten**: 
- Die Seite ist nach Neustart weiterhin vorhanden.

**Tatsächliches Verhalten**:  
- Nach dem Neustart kann MediaWiki die Datei `LocalSettings.php` nicht finden
- MediaWiki lädt die Startseite vor dem Setupwizard.

**Status**: ⚠️  
**Bemerkung**:  
Dass MediaWiki die Datei `LocalSettings.php` nicht finden kann, liegt daran, dass das Verzeichnis `/var/www/html/` nicht persistent ist. Das heisst, die Daten sind persistent gespeichert, das Setup allerdings nicht.  
Nach dem Neustart muss also folgendermassen vorgegangen werden:  
1. Herausfinden, wie der Pod heisst:

   ```powershell
   kubectl get pods -n m347-mediawiki
   ```

2. `LocalSettings.php` erneut dem Verzeichnis hinzufügen:

   ```powershell
   kubectl cp mediawiki/LocalSettings.php m347-mediawiki/<POD_NAME>:/var/www/html/
   ```

Anschliessend tritt das erwartete Verhalten des Testfalls ein.

## M-04: Verbindung zur Datenbank
**Testdatum**: 26.06.2025  
**Tester:in**: Natascha Blumer  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
1. MediaWiki im Browser über `http://mediawiki.m347.ch` aufrufen.
2. Logs prüfen:

   ```powershell
   kubectl logs <POD_NAME> -n m347-mediawiki
   ```

**Erwartetes Verhalten**: 
- Die Seite startet ohne DB-Verbindungsfehler.

**Tatsächliches Verhalten**:  
- Die Seite startet ohne DB-Verbindungsfehler.

**Status**: ✅  
**Bemerkung**: *Keine*  

## M-05: Startseite bearbeiten
**Testdatum**: 26.06.2025  
**Tester:in**: Natascha Blumer  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. MediaWiki läuft im Browser und der Benutzer ist eingeloggt.  
**Beschreibung**:  
1. Auf der Startseite auf die Schaltfläche `Bearbeiten` klicken.
2. Den Text der Seite bearbeiten und anschliessend auf die Schaltfläche `Änderungen speichern` klicken.

**Erwartetes Verhalten**: 
- Änderung wird gespeichert und ist sichtbar.

**Tatsächliches Verhalten**:  
- Änderung wird gespeichert und ist sichtbar.

**Status**: ✅   
**Bemerkung**: *Keine*  

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
