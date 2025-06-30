# Konfiguration - Prometheus
[Einleitung]

- **Verwendung**:
- **Einsatzgrund**:
- **Rolle im System**:

## Ressourcen - Anwendung
Im Folgenden sind alle YAML-Dateien aufgeführt, die zur Bereitstellung und Konfiguration der Anwendung benötigt werden. Sie decken u. a. Container-Deployment, Netzwerkzugriff, Speicheranbindung sowie Konfigurations- und Zugriffsdaten ab.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `deployment.yaml` | Startet den App-Container |
| Service | `service.yaml` | Interner Netzwerkzugriff |
| Persistent Volume Claim | `pvc.yaml` | Persistenz für Daten |
| ConfigMap | `configmap.yaml` | Konfigurationsparameter |
| Secret | `secret.yaml` | Zugangsdaten oder Tokens |
| Ingress | `prometheus-ingress.yaml` | Zugriff via Hostname |

## Files
### Deployment
>Definiert das Deployment für Prometheus inkl. Mount des Volumes, Pfad zur ConfigMap und Container-Ports.

[Hier kommen die Konfigurationsdetails]
```yaml
# deployment.yaml
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, damit z. B. Grafana Prometheus als Datenquelle erreichen kann.

[Hier kommen die Konfigurationsdetails]
```yaml
# service.yaml
```

### Persistente Daten (PVC)
>Stellt ein Persistent Volume bereit, in dem Prometheus seine Zeitreihendaten speichert.

[Hier kommen die Konfigurationsdetails]
```yaml
# pvc.yaml
```

### ConfigMap & Secret
>Enthält die zentrale Prometheus-Konfiguration (z. B. scrape-Intervalle, Targets) sowie optionale vertrauliche Informationen.

#### ConfigMap
[Hier kommen die Konfigurationsdetails]
```yaml
# configmap.yaml
```

#### Secret
[Hier kommen die Konfigurationsdetails]
```yaml
# secret.yaml
```

### Ingress / Externer Zugriff
>Regelt den externen Zugriff auf Prometheus über den Hostnamen mithilfe eines Ingress Controllers.

Die Datei `prometheus-ingress.yaml` definiert, unter welchem Hostnamen (`prometheus.m347.ch`) Prometheus von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service von Prometheus.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

