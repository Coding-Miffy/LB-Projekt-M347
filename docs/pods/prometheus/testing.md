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

## P-01: Zugriff auf Web-UI
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
- Browser öffnen und URL `http://prometheus.m347.ch` aufrufen.

**Erwartetes Verhalten**:  
- Die Web-Oberfläche von Prometheus wird geladen und zeigt keine Fehlermeldung.

**Tatsächliches Verhalten**:  
- UI wurde erfolgreich angezeigt.

**Status**: ✅  
**Bemerkung**: *Keine*

## P-02: Blackbox-Checks prüfen
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
- In der Prometheus-UI die Abfrage `probe_success` eingeben und ausführen.
- Ergebnisse der überwachten Blackbox-Targets prüfen.

**Erwartetes Verhalten**:  
- Alle konfigurierten Services zeigen im Graphen den Statuswert `1`, was „up“ bedeutet.

**Tatsächliches Verhalten**:  
- Alle Targets waren „up“.

**Status**: ✅  
**Bemerkung**: *Keine*

## P-03: PromQL-Abfrage
**Testdatum**: 30.06.2025  
**Tester:in**: Sascha  
**Ausgangslage**: Minikube läuft und der Cluster ist gestartet.  
**Beschreibung**:  
- Im Prometheus-UI die PromQL-Abfrage `up` ausführen.
- Ergebnisse kontrollieren.

**Erwartetes Verhalten**:  
- Die Abfrage liefert die erwarteten Ergebnisse mit allen aktiven Targets und deren Status.

**Tatsächliches Verhalten**:  
- Abfrage lieferte die korrekten Ergebnisse.

**Status**: ✅  
**Bemerkung**: *Keine*

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
