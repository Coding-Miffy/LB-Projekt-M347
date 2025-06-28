# Installation von Redmine

Nach der abgeschlossenen Konfiguration der YAML-Files kann Redmine gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

#### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/redmine`.
- Minikube läuft, und der Cluster ist gestartet.

## 1. Namespace erstellen

Zuerst wird ein eigener Namespace für Redmine erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.

```powershell
kubectl create namespace m347-redmine
```

## 2. Ressourcen deployen

Die YAML-Dateien werden nun in sinnvoller Reihenfolge an den Cluster übergeben.

```powershell
kubectl apply -f redmine/configmap.yaml
kubectl apply -f redmine/secret.yaml
kubectl apply -f redmine/db-configmap.yaml
kubectl apply -f redmine/db-secret.yaml
kubectl apply -f redmine/db-pvc.yaml
kubectl apply -f redmine/redmine-pvc.yaml
kubectl apply -f redmine/db-deployment.yaml
kubectl apply -f redmine/redmine-deployment.yaml
kubectl apply -f redmine/db-service.yaml
kubectl apply -f redmine/redmine-service.yaml
kubectl apply -f redmine/redmine-ingress.yaml
```
## 3. Status der Pods prüfen
   
Mit folgendem Befehl kann überprüft werden, ob beide Pods erfolgreich gestartet wurden:

```powershell
kubectl get pods -n m347-redmine
```

## 4. Redmine starten

Für einen ersten Zugriff kann der Dienst direkt über Minikube geöffnet werden:

```powershell
minikube service redmine-service -n m347-redmine
```

Sobald Ingress aktiviert und korrekt konfiguriert wurde, ist Redmine hier erreichbar:

- http://redmine.m347.ch

## 5. Login

Die Zugangsdaten für den Admin-Account von Redmine lauten standardmäßig:

```powershell
Username: admin
Password: admin
```

## 6. Redmine entfernen

Um Redmine wieder vollständig zu entfernen, kann einfach der gesamte Namespace gelöscht werden:

```powershell
kubectl delete namespace m347-redmine
````









