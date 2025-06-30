# Installation von WordPress

Nach der abgeschlossenen Konfiguration der YAML-Files kann WordPress gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/wordpress`.
- Minikube läuft, und der Cluster ist gestartet.

## 1. Namespace erstellen

Zuerst wird ein eigener Namespace für WordPress erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.

```powershell
kubectl create namespace m347-wordpress
```

## 2. Ressourcen deployen

```powershell
kubectl apply -f wordpress/configmap.yaml
kubectl apply -f wordpress/secret.yaml
kubectl apply -f wordpress/db-pvc.yaml
kubectl apply -f wordpress/pvc.yaml
kubectl apply -f wordpress/db-deployment.yaml
kubectl apply -f wordpress/deployment.yaml
kubectl apply -f wordpress/db-service.yaml
kubectl apply -f wordpress/service.yaml
```
## 3. Status der Pods prüfen

```powershell
kubectl get pods -n m347-wordpress
```

Die Spalte `STATUS` sollte nach kurzer Zeit bei beiden Pods auf `Running` stehen.
Falls ContainerCreating angezeigt wird, bitte etwas Geduld – manche Images brauchen länger.

## 4. WordPress starten

```powershell
minikube service wordpress-service -n m347-wordpress
```

Sobald Ingress aktiviert und korrekt konfiguriert wurde, ist WordPress hier erreichbar:

- http://wordpress.m347.ch

## 5. Erstmaliger Login
Die initialen Zugangsdaten für den Admin-Account von WordPress lauten (siehe `Secret`):

```powershell
Benutzername: admin
Passwort: password
```

Nach dem ersten Login wird empfohlen, das Passwort unmittelbar zu ändern.

## 6. WordPress entfernen

Um WordPress wieder vollständig zu entfernen, kann einfach der gesamte Namespace gelöscht werden:

```powershell
kubectl delete namespace m347-wordpress
```

