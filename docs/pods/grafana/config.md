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

[deployment.yaml](../../../Projekt/monitoring/grafana/deployment.yaml)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
  namespace: m347-grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana
          image: grafana/grafana:latest
          ports:
            - containerPort: 3000
          volumeMounts:
            - name: grafana-storage
              mountPath: /var/lib/grafana
            - name: grafana-datasource
              mountPath: /etc/grafana/provisioning/datasources
          env:
            - name: GF_SECURITY_ADMIN_USER
              valueFrom:
                secretKeyRef:
                  name: grafana-secret
                  key: GF_SECURITY_ADMIN_USER
            - name: GF_SECURITY_ADMIN_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: grafana-secret
                  key: GF_SECURITY_ADMIN_PASSWORD
      volumes:
        - name: grafana-storage
          persistentVolumeClaim:
            claimName: grafana-pvc
        - name: grafana-datasource
          configMap:
            name: grafana-config

```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den Grafana im Cluster erreichbar ist.

[service.yaml](../../../Projekt/monitoring/grafana/service.yaml)
```yaml
apiVersion: v1
kind: Service
metadata:
  name: grafana-service
  namespace: m347-grafana
spec:
  type: ClusterIP
  ports:
    - port: 80
      targetPort: 3000
  selector:
    app: grafana
```

### Persistente Daten (PVC)
>Verknüpft Grafana mit einem Persistent Volume, um Daten wie gespeicherte Dashboards und User-Einstellungen dauerhaft zu sichern.

[pvc.yaml](../../../Projekt/monitoring/grafana/pvc.yaml)
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: grafana-pvc
  namespace: m347-grafana
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
```

### ConfigMap & Secret
>Stellt Konfigurationswerte und Zugangsdaten bereit, auf die Grafana beim Start zugreift.

#### ConfigMap
[configmap.yaml](../../../Projekt/monitoring/grafana/configmap.yaml)
```yaml
apiVersion: v1                              # API-Version für ConfigMap
kind: ConfigMap                             # Objekt-Typ: eine ConfigMap 
metadata:
  name: grafana-config                      # Interner Name der ConfigMap, über den sie im Deployment referenziert wird
  namespace: m347-grafana                   # Namespace, in dem die ConfigMap gespeichert ist
data:                                       # Ab hier: Datenblock mit Schlüsselwertpaaren
  grafana.ini: |
    [server]
    root_url = http://localhost:3000
    [security]
    admin_user = ${GF_SECURITY_ADMIN_USER}
    admin_password = ${GF_SECURITY_ADMIN_PASSWORD}
```

#### Secret
[secret.yaml](../../../Projekt/monitoring/grafana/secret.yaml)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: grafana-secret
  namespace: m347-grafana
type: Opaque
stringData:                     #Hier können Klartexte eingegeben werden, da automatisch in Base64 kodiert (intern)
  GF_SECURITY_ADMIN_USER: admin         
  GF_SECURITY_ADMIN_PASSWORD: password   

```

### Data Provisioning
>Definiert in YAML die automatische Anbindung von Prometheus als Datenquelle. Wird beim Start von Grafana erkannt und geladen.

[data-provisioning.yaml](../../../Projekt/monitoring/grafana/data-provisioning.yaml)
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: grafana-datasource
  namespace: m347-grafana
  labels:
    grafana_datasource: "1"
data:
  datasource.yaml: |
    apiVersion: 1
    datasources:
      - name: Prometheus
        type: prometheus
        url: http://prometheus-service.m347-prometheus.svc.cluster.local:80
        access: proxy
        isDefault: true
```

### Ingress / Externer Zugriff
>Regelt den externen Zugriff auf Grafama über den Hostnamen mithilfe eines Ingress Controllers.

Die Datei `grafana-ingress.yaml` definiert, unter welchem Hostnamen (`grafana.m347.ch`) Grafana von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service von Grafana.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

