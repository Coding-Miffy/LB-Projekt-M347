# Konfiguration - WordPress

- **Verwendung**:  
  WordPress wird als Container-Applikation im Kubernetes-Cluster betrieben. Die Konfiguration erfolgt über separate YAML-Dateien für      Deployment, Netzwerk, Persistenz und Sicherheit.
 
- **Einsatzgrund**:  
  WordPress ist ein etabliertes Content-Management-System (CMS) zur Erstellung und Verwaltung von Websites. Durch den Containerbetrieb werden Wiederverwendbarkeit, Skalierbarkeit und Portierbarkeit erhöht.
 
- **Rolle im System**:  
  WordPress dient als zentrale Webplattform zur Veröffentlichung und Verwaltung von Webinhalten. Es wird über Ingress erreichbar gemacht und nutzt eine persistente MariaDB-Datenbank.

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

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: wordpress-pvc
  namespace: m347-wordpress
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: standard
```

### Datenbank - Deployment
>Startet die zugehörige Datenbankinstanz inkl. Volume, Ports und Konfiguration.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mariadb-deployment
  namespace: m347-wordpress
  labels:
    app: mariadb
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mariadb
  template:
    metadata:
      labels:
        app: mariadb
    spec:
      containers:
      - name: mariadb
        image: mariadb:latest
        ports:
        - containerPort: 3306
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: secret
              key: root_password
        - name: MYSQL_DATABASE
          valueFrom:
            configMapKeyRef:
              name: configmap
              key: database_name
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: secret
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: secret
              key: password
        volumeMounts:
        - mountPath: "/var/lib/mysql"
          name: mariadb-persistent-storage
      volumes:
      - name: mariadb-persistent-storage
        persistentVolumeClaim:
          claimName: mariadb-pvc
```

### Datenbank - Service
>Stellt einen internen Kubernetes-Service für die Datenbank bereit, der durch die App genutzt wird.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: mariadb-service
  namespace: m347-wordpress
spec:
  selector:
    app: mariadb
  ports:
  - protocol: TCP
    port: 3306
    targetPort: 3306
```

### Datenbank - Persistente Daten (PVC)
>Bindet ein Volume für die dauerhafte Speicherung von Datenbankdaten ein.

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mariadb-pvc
  namespace: m347-wordpress
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
  storageClassName: standard
```

### ConfigMap & Secret
>Definiert zentrale Konfigurationswerte (ConfigMap) und vertrauliche Daten (Secret), die in App und DB referenziert werden.

#### ConfigMap
[Hier kommen die Konfigurationsdetails]
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap
  namespace: m347-wordpress
data:
  database_name: wordpress
```

#### Secret
[Hier kommen die Konfigurationsdetails]
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secret
  namespace: m347-wordpress
type: Opaque
data:
  username: d29yZHByZXNz # wordpress
  password: cGFzc3dvcmQ= # password
  root_password: cm9vdF9wYXNzd29yZA== # root_password
```

### Ingress / Externer Zugriff
>Regelt den externen Zugriff auf die Anwendung über Hostnamen mithilfe eines Ingress Controllers.

Die Datei `wordpress-ingress.yaml` definiert, unter welchem Hostnamen (`wordpress.local`) die WordPress-Applikation von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service der WordPress-Anwendung.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
Bei der Umsetzung und Bereitstellung der WordPress-Anwendung im Kubernetes-Cluster zeigte sich deutlich, wie stark standardisiert und gleichzeitig eingeschränkt man in der Gestaltung der YAML-Konfigurationsdateien tatsächlich ist. Kubernetes gibt eine strikte Struktur und klare Anforderungen für Ressourcen wie Deployments, Services, PersistentVolumeClaims und Secrets vor, die zwingend eingehalten werden müssen. Dadurch bleibt wenig Raum für individuelle Anpassungen oder kreative Lösungen.
Dies mag auf den ersten Blick einschränkend wirken, ist jedoch einer der zentralen Vorteile von Kubernetes: Die Standardisierung sorgt für einheitliche, zuverlässige und reproduzierbare Abläufe beim Bereitstellen und Verwalten von Anwendungen. Die Herausforderung bestand weniger darin, eigene kreative Lösungen zu entwickeln, als vielmehr darin, die bestehenden Vorgaben präzise umzusetzen.
Es war überraschend und zugleich lehrreich, festzustellen, wie stark Kubernetes die konkrete Umsetzung beeinflusst und gleichzeitig vereinfacht – vorausgesetzt, man hält sich genau an die vorgegebenen Standards.
