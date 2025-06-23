>[!IMPORTANT]
>Hoi zäme!
>In diesem Markdown habe ich mal die Eckpfeiler für Doku und Präsi erfasst, dass uns nichts untergeht :)  
>Im Ordner `Projekt` habe ich mal eine ungefähre Ordner-/Datei-Struktur aufgesetzt, mit Dummy-Files. Natürlich alles noch nicht fix, einfach mal für den Überblick.
>
>Unter `/docs/worklog` habe ich für jeden von uns ein md-File fürs Arbeitsjournal / Fazit vorbereitet

# Struktur der Projektdokumentation
> Gemäss erhaltener Aufgabenstellung
- *Titelblatt*
- *Inhaltsverzeichnis*
- *Verwendete Technologien*
- *Anwendungsbeispiel*

**Modul**: 347 - Dienst mit Container anwenden  
**Projektname**:  
**Datum**:  
**Autor:innen**: Blumer, Natascha; Ebbinghaus, Max; Ritter, Sascha;  
**Version**:  

## Infrastruktur
![Diagramm der Infrastruktur](/docs/images/infrastructure.png)
Für unser Projekt haben wir eine vollständig containerisierte Infrastruktur in Kubernetes umgesetzt. Die gesamte Umgebung läuft lokal auf einem einzigen Node. Sie umfasst insgesamt **9 Pods** inklusive einem zentralen **Ingress Controller**, **8 Services**, **8 PVCs** sowie dedizierten Komponenten für Konfiguration und Secrets.

### Bestandteile der Infrastruktur
#### Anwendungspods
- **Pod 1**: Jira
- **Pod 3**: WordPress
- **Pod 5**: MediaWiki
- **Pod 7**: Grafana

Alle Anwendungspods sind über einen **ClusterIP-Service** verfügbar und werden durch den Ingress Controller angesprochen. Jeder Pod läuft in einem eigenen Deployment mit `replicas: 1` und nutzt jeweils eine eigene **ConfigMap** und ein eigenes **Secret**.

#### Datenbankpods
- **Pod 2**: PostgreSQL (für Jira)
- **Pod 4**: MySQL (für WordPress)
- **Pod 6**: MariaDB (für MediaWiki)
- **Pod 8**: Prometheus (zur Speicherung von Metriken)

Jede Datenbank wird über einen eigenen **ClusterIP-Service** angesprochen und nutzt ein **Persistent Volume** über einen zugehörigen **PVC (Persistent Volume Claim)**. Auch hier ist jeweils ein einzelnes Replikat (`replicas: 1`) im Einsatz.

#### Infrastrukturpods
- **Pod 9: Ingress Controller (nginx)**  
  Der Ingress Controller übernimmt die zentrale Exponierung aller Anwendungen nach aussen. Die Weiterleitung erfolgt anhand definierter Hostnamen.

### Konfiguration: ConfigMaps & Secrets
Für Konfigurationswerte und sensible Daten (z. B. Passwörter, Zugangsdaten, Umgebungsvariablen) haben wir **pro Anwendungspod**, der solche Informationen benötigt, eine eigene **ConfigMap** und ein eigenes **Secret** definiert.  
Dieses Vorgehen ermöglicht eine **modulare, wiederverwendbare und sichere Konfiguration** einzelner Komponenten. So greifen beispielsweise Jira, WordPress, MediaWiki und Prometheus jeweils nur auf ihre spezifischen Konfigurationswerte zu – etwa Datenbankverbindungsdaten oder Metriken-Konfiguration.  
Die Trennung erhöht die Übersichtlichkeit, reduziert potentielle Fehlerquellen bei Änderungen und vereinfacht zukünftige Erweiterungen oder Wartungsarbeiten.

### Erreichbarkeit
Alle Applikationen sind **nicht** über Pfade wie `http://localhost/mediawiki`, sondern über **eigene Hostnamen** erreichbar:
- `http://jira.local`
- `http://wordpress.local`
- `http://mediawiki.local`
- `http://grafana.local`

#### Warum Hostnames statt Pfade?
Viele Webapplikationen – darunter WordPress, MediaWiki und Jira – sind **nicht dafür ausgelegt, in Unterverzeichnissen zu laufen**. Andernfalls kann es zu fehlerhaften Asset-Referenzen (z. B. fehlende CSS-Dateien), Problemen mit Plugins oder fehlerhaften Weiterleitungen kommen.  
**Lösung**: Jede Applikation erhält ihren eigenen Hostnamen im Ingress. Damit funktioniert die Auslieferung zuverlässig und erwartungskonform.
>[!NOTE]
>Damit diese Hostnamen lokal funktionieren, muss die Datei `C:\Windows\System32\drivers\etc\hosts` um entsprechende Einträge ergänzt werden (z. B. `127.0.0.1 wordpress.local`).

### Eingesetzte Services
Alle Services wurden auf den Typ `ClusterIP` gesetzt. Das bedeutet, sie sind nur intern im Cluster erreichbar. Der externe Zugriff erfolgt ausschliesslich über den **Ingress Controller**.

**Vorteile dieses Ansatzes**:
- **Zentrale Steuerung der Exponierung**: Nur der Ingress Controller ist von aussen erreichbar, was die Sicherheit erhöht.
- **Klarer Aufbau**: App-Pods sprechen Datenbank-Pods über interne ClusterIP-Services an.
- **Standardisierte Adressierung**: Dank dedizierter Hostnamen erfolgt der Zugriff über Klartext-URLs wie `http://jira.local`.

### Umgang mit Replikation
Alle Deployments in unserem Projekt verwenden aktuell:
```yaml
replicas: 1
```
Dies bedeutet, dass pro Komponente jeweils **ein einzelner Pod** betrieben wird.  
Für unser Projekt ist diese Konfiguration zweckmässig, da die Umgebung lokal auf einem **Single-Node-Cluster** betrieben wird und Hochverfügbarkeit in diesem Kontext keinen praktischen Nutzen bietet.

In einer produktiven Umgebung würde man für skalierbare Anwendungen (z. B. WordPress oder MediaWiki) typischerweise `replicas: 2` oder mehr definieren, um eine höhere Verfügbarkeit, Lastverteilung und unterbrechungsfreie Updates zu ermöglichen.  
Für Datenbankpods setzen wir bewusst auf **ein einzelnes Replikat**, da echte Datenbankreplikation komplexer ist und hier nicht notwendig war.

### Kommunikation & Zugriff
Die Kommunikation erfolgt gemäss folgendem Muster:
```text
ConfigMap/Secret → von App-Pods und Prometheus referenziert
User/Browser → Ingress Controller
Ingress Controller → ClusterIP-Service (App)
App-Pod → ClusterIP-Service (DB)
DB-Pod → PVC → PV
```

### Übersicht der Persistent Volumes & Claims
Wir haben uns bewusst für **vier separate PVCs** entschieden, einen für jede datenhaltende Komponente:
| PVC | Zugehöriger Pod | Zweck |
| :--- | :--- | :--- |
| Claim für PostgreSQL | **Pod 2** – PostgreSQL | Speichert Jira-Daten |
| Claim für MySQL | **Pod 4** – MySQL | Speichert WordPress-Daten |
| Claim für MariaDB | **Pod 6** – MariaDB | Speichert MediaWiki-Daten |
| Claim für Prometheus | **Pod 8** – Prometheus | Speichert Monitoringdaten-Daten |

**Vorteile dieses Ansatzes**:
- **Datenisolierung**: Jede Anwendung speichert ihre Daten unabhängig.
- **Wartbarkeit**: Daten lassen sich gezielt sichern, wiederherstellen oder verschieben.
- **Erweiterbarkeit**: Einfache Anpassung oder Skalierung einzelner Komponenten ist möglich.

### Fazit
Unsere Infrastruktur ist klar strukturiert, modular aufgebaut und folgt den Best Practices für Kubernetes:
- Trennung von Anwendungen, Datenhaltung und Infrastruktur
- Sichere & zentrale Exponierung über Ingress und dedizierte Hostnamen
- Datenpersistenz durch dedizierte PVCs
- Konfigurationsverwaltung durch ConfigMap & Secret
- Skalierbarkeit durch `replicas`-Definition pro Pod

Das beigefügte Architekturdiagramm veranschaulicht die Infrastruktur übersichtlich und dient als technische Grundlage für Deployment, Betrieb und Wartung.

## Konfiguration
- Wordpress
- MediaWiki
- Jira
- Monitoring

## Testplan 
- Wordpress
- MediaWiki
- Jira
- Monitoring

## Testergebnisse
- Wordpress
- MediaWiki
- Jira
- Monitoring

## Installationsanleitung
- Für den Dozenten

## Arbeitsjournal und persönliches Fazit
- [NB](/docs/worklog/worklog-nb.md)
- [ME](/docs/worklog/worklog-me.md)
- [SR](/docs/worklog/worklog-sr.md)

## Hilfestellungen
Notizen:
- Unterstützung von Yves zur Infrastruktur

# Struktur der Präsentation
> Gemäss erhaltener Aufgabenstellung
- Infrastruktur (schematisch)
- Verwendete Softwarekomponenten einzeln vorstellen
- Einzelne Schritte des Deployments und involvierte Infrastrukturen
- Jedes Gruppenmitglied muss vortragen
