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

[deployment.yaml](../../../Projekt/monitoring/prometheus/deployment.yaml)
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
  namespace: m347-prometheus
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      containers:
        - name: prometheus
          image: prom/prometheus
          args:
            - "--config.file=/etc/prometheus/prometheus.yml"
          ports:
            - containerPort: 9090
          volumeMounts:
            - name: prometheus-config
              mountPath: /etc/prometheus
            - name: prometheus-storage
              mountPath: /prometheus
      volumes:
        - name: prometheus-config
          configMap:
            name: prometheus-config
        - name: prometheus-storage
          persistentVolumeClaim:
            claimName: prometheus-pvc
```

### Service
>Stellt einen internen Kubernetes-Service zur Verfügung, damit z. B. Grafana Prometheus als Datenquelle erreichen kann.

[service.yaml](../../../Projekt/monitoring/prometheus/service.yaml)
```yaml
apiVersion: v1
kind: Service
metadata:
  name: prometheus-service
  namespace: m347-prometheus
spec:
  type: ClusterIP
  ports:
    - port: 80                        # Ingress ruft Port 80 auf
      targetPort: 9090                # Container hört auf 9090
  selector:
    app: prometheus
```

### Persistente Daten (PVC)
>Stellt ein Persistent Volume bereit, in dem Prometheus seine Zeitreihendaten speichert.

[pvc.yaml](../../../Projekt/monitoring/prometheus/pvc.yaml)
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: prometheus-pvc
  namespace: m347-prometheus
spec:
  accessModes:
    - ReadWriteOnce                 #So kann nur ein Node gleichzeitig schreiben
  resources:
    requests:
      storage: 10Gi
  storageClassName: standard
```

### ConfigMap & Secret
>Enthält die zentrale Prometheus-Konfiguration (z. B. scrape-Intervalle, Targets) sowie optionale vertrauliche Informationen.

#### ConfigMap
[configmap.yaml](../../../Projekt/monitoring/prometheus/configmap.yaml)
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: m347-prometheus
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
    scrape_configs:
      - job_name: prometheus
        static_configs:
          - targets: ['localhost:9090']

      - job_name: grafana
        static_configs:
          - targets: 
              - grafana-service.m347-grafana.svc.cluster.local:80

      - job_name: wordpress-http
        metrics_path: /probe
        params:
          module: [http_2xx]
        static_configs:
          - targets:
              - wordpress-service.m347-wordpress.svc.cluster.local
        relabel_configs:
          - source_labels: [__address__]
            target_label: __param_target
          - source_labels: [__param_target]
            target_label: instance
          - target_label: __address__
            replacement: blackbox-exporter.m347-prometheus.svc.cluster.local:9115

      - job_name: redmine-http
        metrics_path: /probe
        params:
          module: [http_2xx]
        static_configs:
          - targets:
              - redmine-service.m347-redmine.svc.cluster.local
        relabel_configs:
          - source_labels: [__address__]
            target_label: __param_target
          - source_labels: [__param_target]
            target_label: instance
          - target_label: __address__
            replacement: blackbox-exporter.m347-prometheus.svc.cluster.local:9115

      - job_name: mediawiki-http
        metrics_path: /probe
        params:
          module: [http_2xx]
        static_configs:
          - targets:
              - mediawiki-service.m347-mediawiki.svc.cluster.local
        relabel_configs:
          - source_labels: [__address__]
            target_label: __param_target
          - source_labels: [__param_target]
            target_label: instance
          - target_label: __address__
            replacement: blackbox-exporter.m347-prometheus.svc.cluster.local:9115
```

#### Secret
[secret.yaml](../../../Projekt/monitoring/prometheus/secret.yaml)
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: prometheus-secret
  namespace: m347-prometheus
type: Opaque
stringData:                     #Hier können Klartexte eingegeben werden, da automatisch in Base64 kodiert (intern)
  admin-user: admin         
  admin-password: password   

```

### Ingress / Externer Zugriff
>Regelt den externen Zugriff auf Prometheus über den Hostnamen mithilfe eines Ingress Controllers.

Die Datei `prometheus-ingress.yaml` definiert, unter welchem Hostnamen (`prometheus.m347.ch`) Prometheus von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service von Prometheus.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

