# Konfiguration - MediaWiki
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
| Ingress | `mediawiki-ingress.yaml` | Zugriff via Hostname |

## Ressourcen - Datenbank
Die folgenden YAML-Dateien definieren den Betrieb der zugehörigen Datenbank. Diese nutzt dieselben Konfigurationsdateien wie die Anwendung, um einheitliche und zentrale Umgebungsparameter sicherzustellen.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| Deployment | `db-deployment.yaml` | Startet die Datenbank (`MariaDB`) |
| Service | `db-service.yaml` | Intern erreichbar durch App |
| Persistent Volume Claim | `db-pvc.yaml` | Persistenz für Datenbankinhalte |
| Konfiguration | - | Verwendet dieselbe ConfigMap & Secret wie die Anwendung |

## Deployment
>Definiert das Deployment für die Anwendung: Container-Image, Umgebungsvariablen, Volumes und Replikation.

[Hier kommen die Konfigurationsdetails]
```yaml
# deployment.yaml
```

## Service
>Stellt einen internen Kubernetes-Service zur Verfügung, über den die App im Cluster erreichbar ist.

### [`service.yaml`](../../../Projekt/mediawiki/service.yaml)
```yaml
apiVersion: v1                      # Verwendete API-Version für Service
kind: Service                       # Objekttyp: Service (erzeugt interne Netzwerkschnittstelle)
metadata: 
  name: mediawiki-service           # Interner Name des Service, über den er im Deployment referenziert wird
  namespace: m347-mediawiki         # Namespace, in dem der Service gespeichert ist
spec:
  type: ClusterIP                   # Interner Servie (kein externer Zugriff) - Default
  selector:
    app: mediawiki
  ports:
    - port: 80                      # Service-Port im Cluster
      targetPort: 80                # Weiterleitung an Container-Port (von der Applikation vorgegeben)
```

### Erklärung der Konfiguration
- `type: ClusterIP`  
Dieser Typ ist Standard in Kubernetes und sorgt dafür, dass der Service **nur innerhalb des Clusters erreichbar** ist. Externer Zugriff erfolgt über den **Ingress Controller**.  
→ Vorteil: mehr Sicherheit und klare Trennung zwischen internem und externem Verkehr.

- `selector.app: mediawiki`  
  Verbindet den Service mit dem **entsprechenden Pod**. Der Selector greift auf das Label `app: mediawiki` im Deployment zurück und stellt so sicher, dass die Netzwerkanfragen an den richtigen Pod weitergeleitet werden.

- `ports.port: 80`  
  Der Port, auf dem der Service **innerhalb des Clusters** erreichbar ist.

- `ports.targetPort: 80`  
  Der Port, an den der Traffic **im Container selbst** weitergeleitet wird.  
In diesem Fall verwendet der MediaWiki-Container Port 80, da dieser bei Webservern typischerweise als Standard konfiguriert ist.

## Persistente Daten (PVC)
>Fordert persistenten Speicher im Cluster an, z. B. für Medien-Uploads oder Logs der Anwendung.

[Hier kommen die Konfigurationsdetails]
```yaml
# pvc.yaml
```

## Datenbank - Deployment
>Startet die zugehörige Datenbankinstanz inkl. Volume, Ports und Konfiguration.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-deployment.yaml
```

## Datenbank - Service
>Stellt einen internen Kubernetes-Service für die Datenbank bereit, der durch die App genutzt wird.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-service.yaml
```

## Datenbank - Persistente Daten (PVC)
>Bindet ein Volume für die dauerhafte Speicherung von Datenbankdaten ein.

[Hier kommen die Konfigurationsdetails]
```yaml
# db-pvc.yaml
```

## ConfigMap & Secret
>Definiert zentrale Konfigurationswerte (ConfigMap) und vertrauliche Daten (Secret), die in App und DB referenziert werden.

### ConfigMap
[Hier kommen die Konfigurationsdetails]
```yaml
# configmap.yaml
```

### Secret
[Hier kommen die Konfigurationsdetails]
```yaml
# secret.yaml
```

## Ingress / Externer Zugriff
>Regelt den externen Zugriff auf die Anwendung über Hostnamen mithilfe eines Ingress Controllers.

Die Datei `mediawiki-ingress.yaml` definiert, unter welchem Hostnamen (`mediawiki.local`) die MediaWiki-Applikation von ausserhalb des Clusters erreichbar ist.  
Sie verweist auf den zentralen Ingress Controller und sorgt für die Weiterleitung eingehender Anfragen an den zugehörigen Service der MediaWiki-Anwendung.  
Da das zugrundeliegende Ingress-System für alle Anwendungen identisch ist, wird die übergeordnete Konfiguration des Ingress Controllers inklusive Routingprinzipien und Klassendefinition zentral in der [Konfigurationsdatei des Ingress Controllers](../ingress/config.md) dokumentiert.

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]
