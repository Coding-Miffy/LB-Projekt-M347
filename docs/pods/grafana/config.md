# Konfiguration - Grafana
[Einleitung]

- **Verwendung**:
- **Einsatzgrund**:
- **Rolle im System**:

## Ressourcen - Anwendung
Im Folgenden sind alle YAML-Dateien aufgeführt, die zur Bereitstellung und Konfiguration von **Grafana** benötigt werden. Sie definieren unter anderem das Deployment, Netzwerkzugang, persistente Datenspeicherung und die automatische Anbindung an **Prometheus**.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `deployment.yaml` | Startet den App-Container |
| Service | `service.yaml` | Interner Netzwerkzugriff |
| Persistent Volume Claim | `pvc.yaml` | Persistenz für Daten |
| ConfigMap | `configmap.yaml` | Konfigurationsparameter |
| Secret | `secret.yaml` | Zugangsdaten oder Tokens |
| Data Provisioning | `data-provisioning.yaml` | Konfiguriert automatisch Prometheus als Datenquelle |
| Ingress | `grafana-ingress.yaml` | Zugriff via Hostname |

## Files
### Deployment
>Startet den Grafana-Pod mit allen nötigen Konfigurationen, Volumes und Umgebungsvariablen. Verlinkt u. a. PVC, ConfigMap und Secret.

[Hier kommen die Konfigurationsdetails]
```yaml
# deployment.yaml
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den Grafana im Cluster erreichbar ist.

[Hier kommen die Konfigurationsdetails]
```yaml
# service.yaml
```

### Persistente Daten (PVC)
>Verknüpft Grafana mit einem Persistent Volume, um Daten wie gespeicherte Dashboards und User-Einstellungen dauerhaft zu sichern.

[Hier kommen die Konfigurationsdetails]
```yaml
# pvc.yaml
```

### ConfigMap & Secret
>Stellt Konfigurationswerte und Zugangsdaten bereit, auf die Grafana beim Start zugreift.

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

### Data Provisioning
>Definiert in YAML die automatische Anbindung von Prometheus als Datenquelle. Wird beim Start von Grafana erkannt und geladen.

[Hier kommen die Konfigurationsdetails]
```yaml
# data-provisioning.yaml
```

### Ingress / Externer Zugriff
>Regelt den externen Zugriff auf Grafama über den Hostnamen mithilfe eines Ingress Controllers.

Die Datei `grafana-ingress.yaml` definiert, unter welchem Hostnamen (`grafana.m347.ch`) Grafana von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service von Grafana.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

