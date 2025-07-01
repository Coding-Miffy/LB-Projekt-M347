# Testplan - Prometheus
In diesem Abschnitt werden die geplanten Testfälle für **Prometheus** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall | Testziel |
| :-: | :-- | :-- | :-- |
| P-01 | Prometheus | Zugriff auf Prometheus-Web-UI | Sicherstellen, dass die Prometheus-UI über die Ingress-URL erreichbar ist |
| P-02 | Prometheus | Blackbox-Check auf Services | Überprüfen, dass die konfigurierten Blackbox-Checks erfolgreich durchgeführt werden |
| P-03 | Prometheus | PromQL-Abfrage | Testen, ob Prometheus auf Abfragen im Web-UI korrekt reagiert |


# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| P-01 | Zugriff auf Prometheus-UI | Prometheus-UI über prometheus.m347.ch aufrufen | UI lädt ohne Fehler | ✅ |
| P-02 | Blackbox-Check auf Services | Blackbox-Targets in der Prometheus-UI aufrufen und prüfen | Alle Targets sind „up“ | ✅ |
| P-03 | PromQL-Abfrage | Beispielabfrage „up“ im Prometheus-UI durchführen | Ergebnisse werden korrekt angezeigt | ✅ |


## P-01: Zugriff auf Prometheus-Web-UI
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Beschreibung**:  
Browser öffnen und URL `http://prometheus.m347.ch` aufrufen.  
**Erwartetes Verhalten**:  
Die Prometheus-Web-UI wird geladen und zeigt keine Fehler.  
**Tatsächliches Verhalten**:  
Die UI wurde korrekt angezeigt.  
**Status**: ✅  
**Bemerkung**:  
*Keine*

## P-02: Blackbox-Check auf Services
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Beschreibung**:  
In der Prometheus-UI unter „Graph“ nachsehen, ob die Blackbox-Checks für z.B. wordpress-service und redmine-service den Status „up“ haben.  
`probe_success` wurde in der Suchleiste eingegeben.
**Erwartetes Verhalten**:  
Alle konfigurierten Blackbox-Targets sind erreichbar und zeigen „up“.  
**Tatsächliches Verhalten**:  
Alle Targets waren „up“.  
**Status**: ✅  
**Bemerkung**:  
*Keine*

## P-03: PromQL-Abfrage
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Beschreibung**:  
Im Prometheus-UI eine PromQL-Abfrage wie `up` ausführen.  
**Erwartetes Verhalten**:  
Prometheus liefert korrekte Ergebnisse mit allen aktiven Targets.  
**Tatsächliches Verhalten**:  
Abfrage lieferte erwartete Ergebnisse.  
**Status**: ✅  
**Bemerkung**:  
*Keine*

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
