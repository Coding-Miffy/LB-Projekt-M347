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
| M﻿-06 | MediaWiki | Start mit falschen DB-Zugangsdaten | Überprüfung der Fehlerbehandlung bei fehlerhafter Konfiguration |

# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| M﻿-01 | Zugriff via Ingress | MediaWiki im Browser über Hostnamen `mediawiki.m347.ch` aufrufen | Startseite wird erfolgreich geladen |  |
| M﻿-02 | Login mit Admin-Account | Mit Benutzer `mwuser` und Passwort `supergeheim` einloggen | Login erfolgreich, Benutzeroberfläche erscheint |  |
| M﻿-03 | Seite erstellen und Pod neu starten | Seite *TestPersistenz* erstellen, Pod löschen, erneut abrufen | Seite bleibt erhalten |  |
| M﻿-04 | Verbindung zur Datenbank | MediaWiki starten, prüfen ob keine DB-Fehler erscheinen | Start erfolgt ohne Fehlermeldung |  |
| M﻿-05 | Startseite bearbeiten | Text auf der Startseite ergänzen und speichern | Änderung ist sichtbar |  |
| M﻿-06 | Start mit falschen DB-Zugangsdaten | MediaWiki mit absichtlich falschem Passwort starten | Fehlerhafte Verbindung wird in Logs ausgegeben, Seite lädt nicht korrekt |  |

## M-01: Zugriff via Ingress
**Testdatum**:  
**Tester:in**:  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
1. MediaWiki im Browser über `http://mediawiki.m347.ch` aufrufen.
   
**Erwartetes Verhalten**: 
- Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
**Status**:  
**Bemerkung**:  

## M-02: Login mit Admin-Account
**Testdatum**:  
**Tester:in**:  
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
**Status**:  
**Bemerkung**:  

## M-03: Seite erstellen und Pod neu starten
**Testdatum**:  
**Tester:in**:  
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
**Status**:  
**Bemerkung**:  

## M-04: Verbindung zur Datenbank
**Testdatum**:  
**Tester:in**:  
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
**Status**:  
**Bemerkung**:  

## M-05: Startseite bearbeiten
**Testdatum**:  
**Tester:in**:  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. MediaWiki läuft im Browser und der Benutzer ist eingeloggt.  
**Beschreibung**:  
1. Auf der Startseite auf die Schaltfläche `Bearbeiten` klicken.
2. Den Text der Seite bearbeiten und anschliessend auf die Schaltfläche `Änderungen speichern` klicken.

**Erwartetes Verhalten**: 
- Änderung wird gespeichert und ist sichtbar.

**Tatsächliches Verhalten**:  
**Status**:  
**Bemerkung**:  

## M-06: Start mit falschen DB-Zugangsdaten
**Testdatum**:  
**Tester:in**:  
**Ausgangslage**: Der Cluster läuft, und MediaWiki ist korrekt konfiguriert und wurde zuvor erfolgreich gestartet.  
**Beschreibung**:  
1. In der Datei `secret.yaml` das Passwort `MEDIAWIKI_DB_PASSWORD` absichtlich falsch setzen:

   ```yaml
   stringData:
     MEDIAWIKI_DB_PASSWORD: falschespasswort
   ```

2. Änderungen übernehmen:

    ```powershell
    kubectl apply -f mediawiki/secret.yaml
    kubectl delete pod -l app=mediawiki -n m347-mediawiki
    ```

3. Warten, bis der Pod neu startet:

   ```powershell
   kubectl get pods -n m347-mediawiki
   ```

4. Logs prüfen:

   ```powershell
   kubectl logs <POD_NAME> -n m347-mediawiki
   ```

**Erwartetes Verhalten**:
- Der MediaWiki-Container kann nicht auf die Datenbank zugreifen.
- Die Logs zeigen eine aussagekräftige Fehlermeldung.
- Die Weboberfläche zeigt eine Fehlermeldung oder bleibt im Ladezustand.

**Tatsächliches Verhalten**:  
**Status**:  
**Bemerkung**:  

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
