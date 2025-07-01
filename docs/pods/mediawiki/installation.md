# Installation von MediaWiki
Nach der abgeschlossenen Konfiguration der YAML-Files kann MediaWiki gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

#### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/mediawiki`.
- Minikube läuft, und der Cluster ist gestartet.

> [!NOTE]  
> Die Datei `LocalSettings.php`, die sonst durch den Webinstaller erzeugt wird, liegt bereits **vollständig vorkonfiguriert** im Repository.  
> Ein manueller Setup-Prozess im Browser ist **nicht erforderlich**.

## 1. Namespace erstellen
Zuerst wird ein eigener Namespace für MediaWiki erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.
```powershell
kubectl create namespace m347-mediawiki
```

## 2. Ressourcen deployen
Die YAML-Dateien werden nun in sinnvoller Reihenfolge an den Cluster übergeben.  
Dabei wird zuerst die Konfiguration, dann die Datenhaltung und schliesslich die Anwendung samt Datenbank bereitgestellt.
```powershell
kubectl apply -f mediawiki/configmap.yaml
kubectl apply -f mediawiki/secret.yaml
kubectl apply -f mediawiki/db-pvc.yaml
kubectl apply -f mediawiki/pvc.yaml
kubectl apply -f mediawiki/db-deployment.yaml
kubectl apply -f mediawiki/deployment.yaml
kubectl apply -f mediawiki/db-service.yaml
kubectl apply -f mediawiki/service.yaml
```

## 3. Status der Pods prüfen
Mit folgendem Befehl kann überprüft werden, ob beide Pods erfolgreich gestartet wurden:
```powershell
kubectl get pods -n m347-mediawiki
```
Die Spalte `STATUS` sollte nach kurzer Zeit bei beiden Pods auf `Running` stehen.  
Falls `ContainerCreating` angezeigt wird, bitte etwas Geduld – manche Images brauchen länger.

## 4. `LocalSettings.php` in den Pod kopieren
Damit MediaWiki korrekt funktioniert, muss die Konfigurationsdatei `LocalSettings.php` im **Webroot-Verzeichnis** `/var/www/html/` des Containers vorhanden sein.

Zuerst den Namen des MediaWiki-Pods ermitteln:
```powershell
kubectl get pods -n m347-mediawiki
```

Dann die Datei in den Pod kopieren:
```powershell
kubectl cp mediawiki/LocalSettings.php m347-mediawiki/<POD_NAME>:/var/www/html/
```

> [!WARNING]
> Das Verzeichnis `/var/www/html/` ist **nicht persistent**.  
> Wenn der Pod neu gestartet oder ersetzt wird, **muss dieser Schritt wiederholt werden**.

## 5. MediaWiki starten
Für einen ersten Zugriff kann der Dienst direkt über Minikube geöffnet werden:
```powershell
minikube service mediawiki-service -n m347-mediawiki
```
Sobald Ingress aktiviert und korrekt konfiguriert wurde, ist MediaWiki hier erreichbar:
- [http://mediawiki.m347.ch](http://mediawiki.m347.ch)

## 6. Login
Die Zugangsdaten für den Admin-Account von MediaWiki lauten:
```txt
Username: Admin
Password: Adminpassword
```

## 7. MediaWiki entfernen
Um MediaWiki wieder vollständig zu entfernen, kann einfach der gesamte Namespace gelöscht werden:
```powershell
kubectl delete namespace m347-mediawiki
```
