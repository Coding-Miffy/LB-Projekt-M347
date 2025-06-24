# Konfiguration - Jira
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
| Ingress | `jira-ingress.yaml` | Zugriff via Hostname |

## Ressourcen - Datenbank
Die folgenden YAML-Dateien definieren den Betrieb der zugehörigen Datenbank. Diese nutzt dieselben Konfigurationsdateien wie die Anwendung, um einheitliche und zentrale Umgebungsparameter sicherzustellen.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `db-deployment.yaml` | Startet die Datenbank (`PostgreSQL`) |
| Service | `db-service.yaml` | Intern erreichbar durch App |
| Persistent Volume Claim | `db-pvc.yaml` | Persistenz für Datenbankinhalte |
| Konfiguration | - | Verwendet dieselbe ConfigMap & Secret wie die Anwendung |

## Files
### Deployment
>Definiert das Deployment für die Anwendung: Container-Image, Umgebungsvariablen, Volumes und Replikation.

[Hier kommen die Konfigurationsdetails]
```yaml
# deployment.yaml
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den die App im Cluster erreichbar ist.

[Hier kommen die Konfigurationsdetails]
```yaml
# service.yaml
```

### Persistente Daten (PVC)
>Fordert persistenten Speicher im Cluster an, z. B. für Medien-Uploads oder Logs der Anwendung.

[Hier kommen die Konfigurationsdetails]
```yaml
# pvc.yaml
```

### Datenbank - Deployment
>Startet die zugehörige Datenbankinstanz inkl. Volume, Ports und Konfiguration.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-deployment.yaml
```

### Datenbank - Service
>Stellt einen internen Kubernetes-Service für die Datenbank bereit, der durch die App genutzt wird.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-service.yaml
```

### Datenbank - Persistente Daten (PVC)
>Bindet ein Volume für die dauerhafte Speicherung von Datenbankdaten ein.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-pvc.yaml
```

### ConfigMap & Secret
>Definiert zentrale Konfigurationswerte (ConfigMap) und vertrauliche Daten (Secret), die in App und DB referenziert werden.

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
>Regelt den externen Zugriff auf die Anwendung über Hostnamen mithilfe eines Ingress Controllers.

[Hier kommen die Konfigurationsdetails]
```yaml
# jira-ingress.yaml
```

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

