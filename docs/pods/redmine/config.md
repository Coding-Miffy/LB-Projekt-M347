# Konfiguration - Redmine
[Einleitung]

- **Verwendung**:Redmine wird als Container-Applikation innerhalb eines Kubernetes-Clusters betrieben. Die Konfiguration erfolgt über eigenständige YAML-Dateien, die das Deployment der Applikation, den Netzwerkzugriff, persistente Speicherung und sichere Verwaltung sensibler Daten definieren.
  
- **Einsatzgrund**:Redmine ist eine etablierte Open-Source-Projektmanagement-Plattform, die besonders für Issue-Tracking, Projektverwaltung und Wissensmanagement genutzt wird. Der Betrieb als Container ermöglicht flexible Skalierung, einfache Portabilität und schnelle Wiederherstellbarkeit der Anwendung.
  
- **Rolle im System**:Redmine dient als zentrale Plattform zur Verwaltung von Projekten, Tickets, Dokumentationen und zur internen Kommunikation. Die Anwendung ist extern über Ingress erreichbar und verwendet eine persistente PostgreSQL-Datenbank.

## Ressourcen - Anwendung
Im Folgenden sind alle YAML-Dateien aufgeführt, die zur Bereitstellung und Konfiguration der Anwendung benötigt werden. Sie decken u. a. Container-Deployment, Netzwerkzugriff, Speicheranbindung sowie Konfigurations- und Zugriffsdaten ab.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `deployment.yaml` | Startet den App-Container |
| Service | `service.yaml` | Interner Netzwerkzugriff |
| Persistent Volume Claim | `pvc.yaml` | Persistenz für Daten |
| ConfigMap | `configmap.yaml` | Konfigurationsparameter |
| Secret | `secret.yaml` | Zugangsdaten oder Tokens |
| Ingress | `redmine-ingress.yaml` | Zugriff via Hostname |

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

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redmine
  namespace: m347-redmine
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redmine
  template:
    metadata:
      labels:
        app: redmine
    spec:
      containers:
      - name: redmine
        image: redmine:latest
        ports:
        - containerPort: 3000
        envFrom:
        - configMapRef:
            name: redmine-config
        - secretRef:
            name: redmine-secret
        volumeMounts:
        - name: redmine-data
          mountPath: /usr/src/redmine/files
      volumes:
      - name: redmine-data
        persistentVolumeClaim:
          claimName: redmine-pvc
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den die App im Cluster erreichbar ist.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: redmine-service
  namespace: m347-redmine
spec:
  type: ClusterIP
  selector:
    app: redmine
  ports:
  - protocol: TCP
    port: 80
    targetPort: 3000
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

Die Datei `redmine-ingress.yaml` definiert, unter welchem Hostnamen (`redmine.local`) die Redmine-Applikation von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service der Redmine-Anwendung.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

