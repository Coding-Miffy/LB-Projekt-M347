>[!IMPORTANT]
>Hoi zäme!
>### Überblick
>1. Unter `/Projekt` habe ich für jeden geplanten Pod einen Ordner erstellt. Darin befinden sich alle benötigten Yaml-Files (aktuell noch leer).
>
>2. Unter `/docs/pods` habe ich für jeden geplanten Pod einen Ordner erstellt. Darin befinden sich alle benötigten md-Files für die Doku: `config.md`, `installation.md` und `testing.md`. Für das Testing und die Konfiguration habe ich bereits je ein Template erstellt. Für die Installation versuche ich auch noch ein Template anzufertigen.
>
>3. Unter `/docs/worklogs` habe ich für jeden von uns ein md-File fürs Arbeitsjournal / Fazit mit Template vorbereitet.

# Projektdokumentation

**Modul**: 347 - Dienst mit Container anwenden  
**Projektname**:  LB M347
**Autor:innen**: Blumer, Natascha; Ebbinghaus, Max; Ritter, Sascha;  
**Datum**:  
**Version**:  

## Einleitung
[Hier kommt die Einleitung hin]

## Ausgangslage
Die **M347 GmbH** plant den Aufbau einer internen IT-Umgebung, die mehrere zentrale Anforderungen zuverlässig und modular abdeckt:
- **WordPress** dient als Firmenblog, um aktuelle Themen, Mitteilungen und Veranstaltungen zu kommunizieren.
- **MediaWiki** wird als internes Intranet und Wissensdatenbank genutzt. Mitarbeitende können darin Prozesse, Anleitungen und Projektdokumentationen erfassen und pflegen.
- **Redmine** kommt als Projektmanagement- und Ticketsystem zum Einsatz, um Aufgaben, Zeitaufwände und Teamkommunikation effizient zu steuern.
- **Prometheus** übernimmt das systemweite Monitoring. Es sammelt Metriken der eingesetzten Komponenten und Dienste.
- **Grafana** stellt diese Metriken in Form von übersichtlichen Dashboards grafisch dar. Es wird direkt mit Prometheus als Datenquelle verbunden.

Die gesamte Umgebung wird vollständig **containerisiert** betrieben und mit **Kubernetes** orchestriert.
Ein **zentraler Ingress-Controller** ermöglicht den Zugriff auf alle Komponenten über dedizierte Hostnamen. Durch die Aufteilung in separate Namespaces, den gezielten Einsatz von **Persistent Volumes**, individuellen **ConfigMaps** und **Secrets** sowie die klare Strukturierung der Deployments wird eine skalierbare, wartbare und sichere Infrastruktur gewährleistet.

## Infrastruktur
Für den Betrieb unserer containerisierten Anwendung haben wir eine klar strukturierte Infrastruktur in Kubernetes aufgebaut.  
Eine ausführliche Beschreibung mit Diagramm findet sich hier:
- [Zur Infrastruktur](/docs/infrastructure.md)

## Eingesetzte Technologien
Für den Aufbau und Betrieb der Infrastruktur wurden folgende Kerntechnologien eingesetzt:
- **Docker**  
  Dient als Container-Engine, um die einzelnen Applikationen in isolierten Containern auszuführen. In unserem Setup wird Docker nicht direkt verwendet, um Container manuell zu starten, sondern als Runtime-Backend für Kubernetes (via Minikube). Dadurch profitieren wir von der Portabilität und den bekannten Tools aus dem Docker-Ökosystem, während die Steuerung vollständig über Kubernetes erfolgt.

- **Kubernetes**  
  Orchestriert die verschiedenen Container, übernimmt die Verwaltung von Deployments, Services, Volumes und Skalierung. Kubernetes stellt sicher, dass alle Komponenten zuverlässig und im gewünschten Zustand laufen.

- **Minikube**  
  Dient als lokale Laufzeitumgebung für Kubernetes. Mit Minikube kann ein vollständiger Kubernetes-Cluster auf einem lokalen Rechner simuliert werden, ideal für Entwicklungs- und Testzwecke.

- **Helm**  
  Wird als Paketmanager für Kubernetes genutzt, um den Ingress Controller schnell und standardisiert bereitzustellen. Helm vereinfacht das Verwalten, Updaten und Rollbacken von Kubernetes-Ressourcen erheblich.

- **`kubectl`**  
  Das zentrale Kommandozeilenwerkzeug zur Steuerung des Kubernetes-Clusters. Mit `kubectl` werden Deployments durchgeführt, Pods überwacht, Logs gelesen und die gesamte Clusterverwaltung gesteuert.

## Konfiguration
In diesem Abschnitt sind die technischen Details jeder Komponente dokumentiert. Für jede Applikation oder Infrastrukturkomponente existiert ein eigenes Konfigurationsdokument mit Informationen zu Deployments, Services, Volumes, Secrets, Ingress-Routen und weiteren Ressourcen.  
Ziel ist eine übersichtliche, modulare und nachvollziehbare Darstellung der jeweiligen Kubernetes-Konfiguration inklusive YAML-Files und Besonderheiten.

### Konfiguration der einzelnen Komponenten
- [Redmine - Zur Konfiguration](/docs/pods/redmine/config.md)
- [MediaWiki - Zur Konfiguration](/docs/pods/mediawiki/config.md)
- [WordPress - Zur Konfiguration](/docs/pods/wordpress/config.md)
- [Prometheus - Zur Konfiguration](/docs/pods/prometheus/config.md)
- [Grafana - Zur Konfiguration](/docs/pods/grafana/config.md)
- [Ingress - Zur Konfiguration](/docs/pods/ingress/config.md)

## Automatisierte Installation
> [!NOTE]
> Für den Betrieb der Umgebung müssen Docker Desktop, Minikube und Helm bereits installiert sein.

[Hier kommt die Anleitung zur automatisierten Installation]

### Automatisierte Deinstallation
[Hier kommt die Anleitung zur automatisierten Deinstallation]

## Anleitung zur manuellen Installation
> [!NOTE]
> Für den Betrieb der Umgebung müssen Docker Desktop, Minikube und Helm bereits installiert sein.

Bevor Anwendungen im Kubernetes-Cluster bereitgestellt werden können, muss die lokale Infrastruktur gestartet und überprüft werden. Dieser Abschnitt beschreibt die nötigen Schritte zur Initialisierung des Minikube-Clusters.

### 1. Minikube starten
Mit folgendem Befehl wird ein lokaler Kubernetes-Cluster erstellt:
```powershell
minikube start
```
Minikube lädt dabei die benötigten Komponenten und Images herunter. Beim **ersten Start** kann dieser Vorgang **mehrere Minuten (5–10 min)** in Anspruch nehmen.

> [!WARNING]
> Sollte eine Fehlermeldung erscheinen, liegt dies häufig daran, dass **Docker Desktop nicht aktiv** ist.  
> In diesem Fall: Docker starten und den Befehl erneut ausführen.

### 2. Clusterstatus überprüfen
Nach erfolgreichem Start lässt sich der Status des Clusters wie folgt prüfen:
```powershell
kubectl get nodes
```
Wenn ein Node mit dem Status `Ready` erscheint, ist der Cluster betriebsbereit.

### 3. Netzwerkzugriffe ermöglichen
Damit Dienste über Ingress korrekt erreichbar sind, muss zusätzlich ein Tunnel geöffnet werden:
```powershell
minikube tunnel
```
Dieser Befehl leitet Netzwerkzugriffe vom lokalen System in den Cluster weiter. Das Terminalfenster bleibt dabei offen und aktiv.

> [!TIP]
> Am besten wird `minikube tunnel` **in einem separaten Terminal-Fenster** ausgeführt, damit der Tunnel während der gesamten Laufzeit bestehen bleibt.

## Manuelle Installation der einzelnen Komponenten
Für den Betrieb der Umgebung werden alle Anwendungen und Dienste in **eigenständigen Namespaces** betrieben. Dies ermöglicht eine strukturierte Trennung, eine gezielte Ressourcenzuweisung und erleichtert die Verwaltung der Konfiguration pro Komponente.

Der Ingress-Controller selbst wird **namespace-unabhängig** bereitgestellt und verwendet denselben zentralen Zugriffspunkt für alle Anwendungen.

### Reihenfolge der Komponenteninstallation
Die Komponenten werden in logischer Abfolge installiert, wobei Anwendungen mit Datenbank zuerst kommen. 

Die empfohlene Installationsreihenfolge lautet:
1. **Redmine**
2. **MediaWiki**
3. **WordPress**
4. **Prometheus**
5. **Grafana**
6. **Ingress**

Diese Reihenfolge stellt sicher, dass notwendige Abhängigkeiten (z. B. Datenbanken) vor der Anwendung bereitstehen und Referenzen (z. B. Service-Namen) korrekt aufgelöst werden können.

### Reihenfolge beim Deployment der YAML-Dateien
Für jede Komponente werden die zugehörigen Ressourcen in einer festgelegten Reihenfolge installiert. Dabei wird jeweils **zuerst die Datenbank**, **danach die Anwendung** bereitgestellt.

Die empfohlene Installationsreihenfolge lautet:
1. **Konfiguration** (`ConfigMap` & `Secret`)  
   Enthält Umgebungsvariablen und Zugangsdaten für App und Datenbank.
   
2. **Speicher** (`PersistentVolumeClaim`)  
   Fordert persistenten Speicher für Datenbank und Anwendung an.
   
3. **Deployments**  
   Startet die Container für Datenbank und Anwendung mit zugehöriger Konfiguration und Speicher.
   
4. **Services**  
   Stellt interne Netzwerkzugänge zur Verfügung, über die App und Datenbank kommunizieren können.

### Installationsanleitungen
Die folgenden Seiten beschreiben die Installation jeder Komponente im Detail:
- [Redmine - Zur Installationsanleitung](/docs/pods/redmine/installation.md)
- [MediaWiki - Zur Installationsanleitung](/docs/pods/mediawiki/installation.md)
- [WordPress - Zur Installationsanleitung](/docs/pods/wordpress/installation.md)
- [Prometheus - Zur Installationsanleitung](/docs/pods/prometheus/installation.md)
- [Grafana - Zur Installationsanleitung](/docs/pods/grafana/installation.md)
- [Ingress - Zur Installationsanleitung](/docs/pods/ingress/installation.md)

### Manuelle Deinstallation
[Hier kommt die Anleitung zur manuellen Deinstallation]

## Testplan & Testergebnisse
Zur Qualitätssicherung und Funktionsüberprüfung unserer Kubernetes-Infrastruktur wurden gezielte Tests für jede zentrale Systemkomponente durchgeführt. Dabei lag der Fokus auf folgenden Aspekten:
- **Korrekte Netzwerkverbindungen** (z. B. über ClusterIP oder Ingress),
- **Erwartungsgemässe Funktionalität** der Anwendungen,
- **Sicherstellung der Datenpersistenz** mittels PVCs.

Die Tests wurden **komponentenweise geplant und ausgeführt**.  
Für jede Anwendung bzw. Infrastrukturkomponente wurde ein separates Testdokument erstellt, das sowohl die Testplanung als auch die zugehörigen Testergebnisse enthält:
- [Redmine - Zum Testing](/docs/pods/redmine/testing.md)
- [MediaWiki - Zum Testing](/docs/pods/mediawiki/testing.md)
- [WordPress - Zum Testing](/docs/pods/wordpress/testing.md)
- [Prometheus - Zum Testing](/docs/pods/prometheus/testing.md)
- [Grafana - Zum Testing](/docs/pods/grafana/testing.md)
- [Ingress - Zum Testing](/docs/pods/ingress/testing.md)

## Arbeitsjournal und persönliches Fazit
Im Rahmen dieses Projekts hat jedes Gruppenmitglied ein individuelles **Arbeitsjournal** geführt. Darin wurden die persönlichen Arbeitsschritte, Herausforderungen sowie technische Erkenntnisse dokumentiert. Ergänzend dazu hat jede Person ein **persönliches Fazit** verfasst, in dem die individuellen Lernerfolge, Erfahrungen mit Kubernetes sowie das Zusammenspiel im Team reflektiert werden.

Die folgenden Links führen direkt zu den jeweiligen Arbeitsjournalen:
- [NB - Zum Arbeitsjournal](/docs/worklog/worklog-nb.md)
- [ME - Zum Arbeitsjournal](/docs/worklog/worklog-me.md)
- [SR - Zum Arbeitsjournal](/docs/worklog/worklog-sr.md)

## Hilfestellungen
Während der Bearbeitung des Projekts haben wir verschiedene Formen der Unterstützung in Anspruch genommen – fachlich, methodisch und sprachlich. Der folgende Abschnitt dokumentiert, welche **externen Hilfestellungen** zum Einsatz kamen und in welcher Form sie das Projekt beeinflusst haben.

### Yves Kaufmann (Dozent M347)
- Laufende Unterstützung bei der Konstruktion des Infrastrukturdiagramms

### Thomas Kägi (Ausbildner, NB)
- [Ustü]

### ChatGPT
- Rechtschreibekorrektur und Formulierungshilfe beim Verfassen der Dokumentation
- Unterstützung bei der Installation von Helm
- Fehlersuche
- Inspirationsgebend bei den Testfällen

### Weitere Quellen
- [https://kubernetes.io/docs/concepts/services-networking/service/](https://kubernetes.io/docs/concepts/services-networking/service/)
- [https://hub.docker.com/r/bitnami/wordpress](https://hub.docker.com/r/bitnami/wordpress)
- [https://hub.docker.com/r/prom/prometheus](https://hub.docker.com/r/prom/prometheus)
- [https://hub.docker.com/r/grafana/grafana](https://hub.docker.com/r/grafana/grafana)
