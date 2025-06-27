# Installation von Ingress
Dieser Abschnitt beschreibt die Installation des **Ingress Controllers** mit Helm, die Definition der Ingress-Klasse sowie das Deployment der Ingress-Routen für jede Applikation.

Ingress ermöglicht es, alle im Cluster laufenden Dienste unter klar definierten Hostnamen erreichbar zu machen (z. B. `mediawiki.m347.ch`).

#### Voraussetzungen:
- Minikube läuft, und der Cluster wurde erfolgreich gestartet.
- Alle benötigten Komponenten wurden bereits installiert und funktionieren korrekt.

## Ingress Controller installieren
Die Installation erfolgt mithilfe von **Helm**:

```powershell
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
kubectl create namespace ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx
```

> [!NOTE]
> Nach der Installation gibt Helm ein Beispiel-YAML aus, das zur Orientierung bei der Erstellung eigener Ingress-Files genutzt werden kann ([siehe Konfiguration](/docs/pods/ingress/config.md)).

## Installation überprüfen
Nach der Installation kann der Status des Ingress-Pods überprüft werden:

```powershell
kubectl get pods -n ingress-nginx
```

Der Pod sollte nach kurzer Zeit den Status `Running` erreichen.

## Ingress-Class anwenden
Nun wird die zentrale Ingress-Klasse deployed, auf die sich alle Ingress-Routen bezieht:

```powershell
kubectl apply -f ingress/ingress-class.yaml
```

## Ingress-Routen für Applikationen anwenden
Für jede Applikation wurde eine eigene Ingress-Datei erstellt, basierend auf dem offiziellen Beispiel.  
Diese werden nun nacheinander deployed:

```powershell
kubectl apply -f ingress/redmine-ingress.yaml
kubectl apply -f ingress/mediawiki-ingress.yaml
kubectl apply -f ingress/wordpress-ingress.yaml
kubectl apply -f ingress/prometheus-ingress.yaml
kubectl apply -f ingress/grafana-ingress.yaml
```

## Ingress aktivieren
Damit die definierten Hostnamen korrekt aufgelöst werden, muss der folgende Befehl ausgeführt und **dauerhaft im Hintergrund geöffnet** bleiben:

```powershell
minikube tunnel
```

> Dieser Tunnel sorgt dafür, dass Anfragen wie `http://wordpress.m347.ch` vom lokalen Rechner zum richtigen Cluster-Service weitergeleitet werden.

## Zugriff prüfen
Wenn die Ingress-Konfiguration korrekt ist, sind die Dienste über folgende URLs erreichbar:

- [http://redmine.m347.ch](http://redmine.m347.ch)
- [http://mediawiki.m347.ch](http://mediawiki.m347.ch)
- [http://wordpress.m347.ch](http://wordpress.m347.ch)
- [http://prometheus.m347.ch](http://prometheus.m347.ch)
- [http://grafana.m347.ch](http://grafana.m347.ch)
