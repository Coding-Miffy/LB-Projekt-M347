# Arbeitsjournal
**Autor:in**: Sascha Ritter   
**Datum**: 01.07.2025    
**Version**:  4

## Arbeitsprotokoll
| Datum | Tätigkeit | Bemerkung |
| :-- | :-- | :-- |
| 29.06.2025 | Erstellung der YAML-Files für Prometheus | ConfigMap, PVC, Deployment, Service, Secret |
| 29.06.2025 | Erstellung der YAML-Files für Grafana | ConfigMaps, PVC, Deployment, Service, Secret |
| 29.06.2025 | Konfiguration von Prometheus-Scrape-Jobs |  |
| 29.06.2025 | Integration des Blackbox-Exporters in Prometheus | Deployment + Service erstellt |
| 29.06.2025 | Konfiguration der automatischen Datenquelle in Grafana | Datasource-ConfigMap erstellt und getestet |
| 30.06.2025 | Verfassen der Konfigurationsdokumentation für Prometheus |  |
| 30.06.2025 | Verfassen der Konfigurationsdokumentation für Grafana |  |
| 30.06.2025 | Erstellung der Testkonzepte für Prometheus | Testfälle und Testprotokolle ausgearbeitet |
| 30.06.2025 | Erstellung der Testkonzepte für Grafana | Testfälle und Testprotokolle ausgearbeitet |
| 30.06.2025 | Durchführung der Tests für Prometheus  | Tests ausgeführt und Ergebnisse dokumentiert |
| 01.07.2025 | Durchführung der Tests für Grafana | Tests ausgeführt und Ergebnisse dokumentiert |
| 01.07.2025 | Anpassen der Installationsdokumentation | Erkenntnisse der Tests berücksichtigt |
| 01.07.2025 | Unterstützung bei der finalen Demo-Vorbereitung | Abstimmung im Team, letzte Tests |

## Herausforderungen
Der Einstieg in die Konfiguration von Prometheus und Grafana stellte zunächst eine grosse Herausforderung dar, da mir viele Details zu den einzelnen Ressourcen wie ConfigMaps, PVCs und den komplexen Relabel-Konfigurationen für Blackbox-Checks neu waren. Besonders die genaue Abstimmung zwischen Prometheus, dem Blackbox Exporter und den Services der anderen Anwendungen erforderte ein intensives Einarbeiten und mehrfaches Testen, um die korrekten Verbindungen sicherzustellen.  
  
Auch die automatische Provisionierung der Prometheus-Datenquelle in Grafana war anspruchsvoll. Dabei traten immer wieder Probleme auf, etwa dass Grafana die Datenquelle nicht korrekt erkannte oder die Verbindung als „unreachable“ anzeigte. Diese Fehler zu analysieren und zu beheben, erforderte ein präzises Verständnis des Zusammenspiels der Komponenten im Kubernetes-Cluster.  
  
Insgesamt war die Arbeit mit den Monitoring-Werkzeugen und deren korrekte Einbindung ins Cluster-Setup deutlich komplexer als anfangs erwartet, half mir aber, ein grösseres Verständnis für die technischen Zusammenhänge und Abhängigkeiten in Kubernetes zu entwickeln.
## Reflexion

# Persönliches Fazit
