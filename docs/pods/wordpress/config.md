# Konfiguration - WordPress
[Einleitung]

- **Verwendung**:WordPress wird als Container-Applikation im Kubernetes-Cluster betrieben. Die Konfiguration erfolgt über separate YAML-Dateien für      Deployment, Netzwerk, Persistenz und Sicherheit.
 
- **Einsatzgrund**:WordPress ist ein etabliertes Content-Management-System (CMS) zur Erstellung und Verwaltung von Websites. Durch den Containerbetrieb werden Wiederverwendbarkeit, Skalierbarkeit und Portierbarkeit erhöht.
 
- **Rolle im System**:WordPress dient als zentrale Webplattform zur Veröffentlichung und Verwaltung von Webinhalten. Es wird über Ingress erreichbar gemacht und nutzt eine persistente MariaDB-Datenbank.

## Ressourcen - Anwendung
Im Folgenden sind alle YAML-Dateien aufgeführt, die zur Bereitstellung und Konfiguration der Anwendung benötigt werden. Sie decken u. a. Container-Deployment, Netzwerkzugriff, Speicheranbindung sowie Konfigurations- und Zugriffsdaten ab.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `deployment.yaml` | Startet den App-Container |
| Service | `service.yaml` | Interner Netzwerkzugriff |
| Persistent Volume Claim | `pvc.yaml` | Persistenz für Daten |
| ConfigMap | `configmap.yaml` | Konfigurationsparameter |
| Secret | `secret.yaml` | Zugangsdaten oder Tokens |
| Ingress | `wordpress-ingress.yaml` | Zugriff via Hostname |

## Ressourcen - Datenbank
Die folgenden YAML-Dateien definieren den Betrieb der zugehörigen Datenbank. Diese nutzt dieselben Konfigurationsdateien wie die Anwendung, um einheitliche und zentrale Umgebungsparameter sicherzustellen.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `db-deployment.yaml` | Startet die Datenbank (`MySQL`) |
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
  name: wordpress-deployment
  namespace: m347-wordpress
  labels:
    app: wordpress
spec:
  replicas: 1
  selector:
    matchLabels:
      app: wordpress
  template:
    metadata:
      labels:
        app: wordpress
    spec:
      containers:
      - name: wordpress
        image: wordpress:latest
        ports:
        - containerPort: 80
        env:
        - name: WORDPRESS_DB_HOST
          value: mariadb-service
        - name: WORDPRESS_DB_USER
          valueFrom:
            secretKeyRef:
              name: secret
              key: username
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: secret
              key: password
        - name: WORDPRESS_DB_NAME
          valueFrom:
            configMapKeyRef:
              name: configmap
              key: database_name
        volumeMounts:
        - mountPath: "/var/www/html"
          name: wordpress-persistent-storage
      volumes:
      - name: wordpress-persistent-storage
        persistentVolumeClaim:
          claimName: wordpress-pvc
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den die App im Cluster erreichbar ist.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: wordpress-service
  namespace: m347-wordpress
spec:
  selector:
    app: wordpress
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
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

Die Datei `wordpress-ingress.yaml` definiert, unter welchem Hostnamen (`wordpress.local`) die WordPress-Applikation von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service der WordPress-Anwendung.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]
