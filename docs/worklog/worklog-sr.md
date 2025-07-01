# Arbeitsjournal
**Autor:in**: Sascha Ritter   
**Datum**: 01.07.2025    
**Version**:  1.6

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
| 01.07.2025 | Anpassen der Installationsdokumentation von Grafana | Erkenntnisse der Tests berücksichtigt |
| 01.07.2025 | Unterstützung bei der finalen Demo-Vorbereitung | Abstimmung im Team, letzte Tests |

## Herausforderungen
Der Einstieg in die Konfiguration von Prometheus und Grafana stellte zunächst eine grosse Herausforderung dar, da mir viele Details zu den einzelnen Ressourcen wie ConfigMaps, PVCs und den komplexen Relabel-Konfigurationen für Blackbox-Checks neu waren. Besonders die genaue Abstimmung zwischen Prometheus, dem Blackbox Exporter und den Services der anderen Anwendungen erforderte ein intensives Einarbeiten und mehrfaches Testen, um die korrekten Verbindungen sicherzustellen.  
  
Auch die automatische Provisionierung der Prometheus-Datenquelle in Grafana war anspruchsvoll. Dabei traten immer wieder Probleme auf, etwa dass Grafana die Datenquelle nicht korrekt erkannte oder die Verbindung als „unreachable“ anzeigte. Diese Fehler zu analysieren und zu beheben, erforderte ein präzises Verständnis des Zusammenspiels der Komponenten im Kubernetes-Cluster.  
  
Insgesamt war die Arbeit mit den Monitoring-Werkzeugen und deren korrekte Einbindung ins Cluster-Setup deutlich komplexer als anfangs erwartet, half mir aber, ein grösseres Verständnis für die technischen Zusammenhänge und Abhängigkeiten in Kubernetes zu entwickeln.

## Reflexion
Das Projekt hat mir gezeigt, dass ich in komplexen technischen Aufgabenstellungen oft dazu neige, Probleme zunächst alleine lösen zu wollen, anstatt frühzeitig um Unterstützung zu bitten. Gerade bei der Konfiguration von Prometheus, Grafana und dem Blackbox Exporter stiess ich jedoch mehrfach an Grenzen, die sich nicht allein durch Recherche und Ausprobieren lösen liessen. In diesen Momenten wurde mir bewusst, wie wichtig es ist, frühzeitig Fragen zu stellen und das Wissen im Team zu nutzen.  

Diese Erfahrung half mir, meine Kommunikationsbereitschaft und Teamfähigkeit weiterzuentwickeln. Ich habe gelernt, dass der Austausch mit Kolleg:innen nicht nur Zeit spart, sondern auch die Qualität der Arbeit verbessert. Zudem konnte ich durch die intensive Zusammenarbeit ein besseres Verständnis für die Zusammenhänge im Cluster gewinnen und technische Details nachhaltiger verinnerlichen.  

# Persönliches Fazit
Das Projekt war für mich eine anspruchsvolle, aber sehr lehrreiche Erfahrung. Ich habe erkannt, wie wichtig es ist, grosse Aufgaben im Team in kleinere, gut handhabbare Schritte aufzuteilen und dabei die individuellen Stärken jedes Einzelnen zu nutzen. So konnten wir auch komplexe Herausforderungen gemeinsam erfolgreich bewältigen.  

Aus diesem Projekt nehme ich viele praktische Erkenntnisse mit, die mir helfen werden, künftige Aufgaben effizienter und sicherer zu bewältigen.
