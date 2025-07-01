# Installation von Grafana

Nach der abgeschlossenen Konfiguration der YAML-Files kann Grafana gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/monitoring/grafana`.
- Minikube läuft und der Cluster ist gestartet.

## 1. Namespace erstellen

Zuerst wird ein eigener Namespace für Grafana erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.

```powershell
kubectl create namespace m347-grafana
```

## 2. Ressourcen deployen

Die YAML-Dateien werden nun in sinnvoller Reihenfolge an den Cluster übergeben.

```powershell
kubectl apply -f monitoring/grafana/pvc.yaml
kubectl apply -f monitoring/grafana/configmap.yaml
kubectl apply -f monitoring/grafana/data-provisioning.yaml
kubectl apply -f monitoring/grafana/secret.yaml
kubectl apply -f monitoring/grafana/deployment.yaml
kubectl apply -f monitoring/grafana/service.yaml
```

## 3. Status der Pods prüfen
   
Mit folgendem Befehl kann überprüft werden, ob beide Pods erfolgreich gestartet wurden:

```powershell
kubectl get pods -n m347-grafana
```
Sobald unter `STATUS` die Meldung `Running` steht ist der Pod bereit

## 4. Grafana starten

Für einen ersten Zugriff kann der Dienst direkt über Minikube geöffnet werden:

```powershell
minikube service grafana-service -n m347-grafana
```

Sobald Ingress aktiviert und korrekt konfiguriert wurde, ist Grafana hier erreichbar:

- http://grafana.m347.ch

## 5. Login

Die Zugangsdaten für den Admin-Account von Grafana lauten standardmässig:

```powershell
Username: admin
Password: password
```

## 6. Datenquelle hinzufügen

Falls die Datenquelle "Prometheus" nicht automatisch erkannt wird, muss diese manuell hinzugefügt werden. Im Folgenden ist eine kurze Anleitung:   
**Voraussetzung:** Prometheus läuft und eingeloggt als Admin in Grafana.  
- Unter "Connection" -> "Data Source"
- Dann zu "Settings"
- Runterscrollen zu "Connection" und URL ersetzen mit: `http://prometheus-service.m347-prometheus.svc.cluster.local:80`
- Zu unterst auf "Save & test" drücken

Falls keine Settings angezeigt werden, muss sichergestellt werden, dass der Prometheus-Pod einwandfrei funktioniert. Dann `grafana.m347.ch` neu laden.

## 7. Grafana entfernen

Um Grafana wieder vollständig zu entfernen, kann einfach der gesamte Namespace gelöscht werden:

```powershell
kubectl delete namespace m347-grafana
````
