# Testplan - Grafana
In diesem Abschnitt werden die geplanten Testfälle für **Grafana** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall | Testziel |
| :-: | :-- | :-- | :-- |
| G-01 | Grafana | Zugriff via Ingress | Sicherstellen, dass Grafana über die Ingress-URL erreichbar ist |
| G-02 | Grafana | Login mit Admin-Account | Überprüfen, ob die Authentifizierung mit bekannten Zugangsdaten funktioniert |
| G-03 | Grafana | Dashboard anlegen | Prüfen, ob Dashboards erstellt und gespeichert werden können |
| G-04 | Grafana | Datenquelle überprüfen | Sicherstellen, dass die Prometheus-Datenquelle korrekt eingebunden ist |

# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| G-01 | Zugriff via Ingress | Grafana im Browser über Hostnamen `grafana.m347.ch` aufrufen | Loginseite wird angezeigt | ✅ |
| G-02 | Login mit Admin-Account | Mit Benutzer `admin` und Passwort `password` einloggen | Login erfolgreich, Grafana-Dashboard erscheint | ✅ |
| G-03 | Dashboard anlegen | Neues Dashboard erstellen und Panel hinzufügen | Dashboard wird gespeichert und angezeigt | ⚠️ |
| G-04 | Datenquelle überprüfen | Prometheus-Datenquelle in den Einstellungen aufrufen | Datenquelle ist verbunden und funktionsfähig | ✅ |


## G-01: Zugriff via Ingress
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
1. Browser öffnen und URL `http://grafana.m347.ch` eingeben.

**Erwartetes Verhalten**:  
- Die Loginseite von Grafana erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
- Loginseite wurde korrekt angezeigt.

**Status**: ✅  
**Bemerkung**: *Keine*

## G-02: Login mit Admin-Account
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. Grafana ist über den Browser erreichbar.  
**Beschreibung**:  
1. Benutzername `admin` und Passwort `password` eingeben.
2. Auf die Schaltfläche `Log in` klicken.

**Erwartetes Verhalten**:  
- Benutzer wird erfolgreich eingeloggt und das Haupt-Dashboard wird angezeigt.

**Tatsächliches Verhalten**:  
- Login erfolgreich, Dashboard erscheint.

**Status**: ✅  
**Bemerkung**: *Keine*

## G-03: Dashboard anlegen
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. Benutzer ist in Grafana eingeloggt.  
**Beschreibung**:  
1. Im Menü auf „+ Create“ klicken und „Dashboard“ auswählen.
2. Ein neues Panel hinzufügen und eine einfache Abfrage z.B. `up` aus Prometheus wählen.
3. Dashboard speichern.

**Erwartetes Verhalten**:  
- Das Dashboard wird gespeichert und die Abfrage korrekt angezeigt.

**Tatsächliches Verhalten**:  
- Dashboard wurde erfolgreich erstellt und gespeichert.

**Status**: ⚠️  
**Bemerkung**:  
Es musste zuerst die Verbindung zu Prometheus als Datenquelle manuell erstellt werden. Dies geschah über "Connection" -> "Data Source", dann unter "Settings" -> "Connection" `http://prometheus-service.m347-prometheus.svc.cluster.local:80` 

## G-04: Datenquelle überprüfen
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet. Benutzer ist in Grafana eingeloggt.  
**Beschreibung**:  
1. In Grafana auf „Connection“ → „Data Sources“ gehen.
2. Die automatisch provisionierte Prometheus-Datenquelle öffnen.

**Erwartetes Verhalten**:  
- Datenquelle ist als „Connected“ markiert.

**Tatsächliches Verhalten**:  
- Prometheus-Datenquelle war verbunden.

**Status**: ✅  
**Bemerkung**:  
Wurde in G-03 manuell gemacht.

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
