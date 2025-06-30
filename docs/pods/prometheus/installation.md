# Installation von Prometheus

Nach der abgeschlossenen Konfiguration der YAML-Files kann Grafana gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/monitoring/prometheus`.
- Minikube läuft und der Cluster ist gestartet.

## 1. Namespace erstellen

Zuerst wird ein eigener Namespace für Prometheus erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.

```powershell
kubectl create namespace m347-prometheus
```

## 2. Ressourcen deployen

Die YAML-Dateien werden nun in sinnvoller Reihenfolge an den Cluster übergeben.

```powershell
kubectl apply -f monitoring/prometheus/pvc.yaml
kubectl apply -f monitoring/prometheus/configmap.yaml
kubectl apply -f monitoring/prometheus/secret.yaml
kubectl apply -f monitoring/prometheus/deployment.yaml
kubectl apply -f monitoring/prometheus/service.yaml
```
> [!NOTE]
> Frage:   
> muss `blackbox-exporter-deployment.yaml`auch so deployt werden? funktionert ja auch ohne


## 3. Status der Pods prüfen
   
Mit folgendem Befehl kann überprüft werden, ob beide Pods erfolgreich gestartet wurden:

```powershell
kubectl get pods -n m347-prometheus
```
Sobald unter `STATUS` die Meldung `Running` steht ist der Pod bereit. Dies kann manchmal etwas länger dauern.

## 4. Prometheus starten

Für einen ersten Zugriff kann der Dienst direkt über Minikube geöffnet werden:

```powershell
minikube service prometheus-service -n m347-prometheus
```

Sobald Ingress aktiviert und korrekt konfiguriert wurde, ist Prometheus hier erreichbar:

- http://prometheus.m347.ch

## 5. Login

Die Zugangsdaten für den Admin-Account von Prometheus lauten standardmässig:

```powershell
Username: admin
Password: password
```

## 6. Prometheus entfernen

Um Prometheus wieder vollständig zu entfernen, kann einfach der gesamte Namespace gelöscht werden:

```powershell
kubectl delete namespace m347-prometheus
````
