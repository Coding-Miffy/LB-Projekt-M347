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
**Projektname**:  
**Autor:innen**: Blumer, Natascha; Ebbinghaus, Max; Ritter, Sascha;  
**Datum**:  
**Version**:  

## Einleitung
[Hier kommt die Einleitung hin]

## Ausgangslage
[Hier kommt ein fiktiver Anwendungsfall]

## Infrastruktur
Für den Betrieb unserer containerisierten Anwendung haben wir eine klar strukturierte Infrastruktur in Kubernetes aufgebaut.  
Eine ausführliche Beschreibung mit Diagramm findet sich hier:
- [Zur Infrastruktur](/docs/infrastructure.md)

## Eingesetzte Technologien

## Konfiguration
In diesem Abschnitt sind die technischen Details zur Umsetzung jeder einzelnen Komponente dokumentiert.
Für jede Applikation bzw. Infrastrukturkomponente wurde ein separates Konfigurationsdokument erstellt. Diese enthalten Informationen zu Deployments, Services, Volumes, Secrets, Ingress-Routen und weiteren relevanten Ressourcen.  
Ziel ist es, die Kubernetes-Konfiguration pro Pod **übersichtlich, modular und nachvollziehbar** darzustellen, inklusive eingesetzter YAML-Dateien, Besonderheiten und Herausforderungen.

### Konfiguration der einzelnen Komponenten
- [Redmine - Zur Konfiguration](/docs/pods/redmine/config.md)
- [MediaWiki - Zur Konfiguration](/docs/pods/mediawiki/config.md)
- [WordPress - Zur Konfiguration](/docs/pods/wordpress/config.md)
- [Prometheus - Zur Konfiguration](/docs/pods/prometheus/config.md)
- [Grafana - Zur Konfiguration](/docs/pods/grafana/config.md)
- [Ingress - Zur Konfiguration](/docs/pods/ingress/config.md)

## Installationsanleitung
[Hier kommt die Installationsanleitung für die Basis-Infrastruktur hin]

### Installation der einzelnen Komponenten
[Hier kommt noch: Namespace, Aufbau, Reihenfolge etc.]
- [Redmine - Zur Installationsanleitung](/docs/pods/redmine/installation.md)
- [MediaWiki - Zur Installationsanleitung](/docs/pods/mediawiki/installation.md)
- [WordPress - Zur Installationsanleitung](/docs/pods/wordpress/installation.md)
- [Prometheus - Zur Installationsanleitung](/docs/pods/prometheus/installation.md)
- [Grafana - Zur Installationsanleitung](/docs/pods/grafana/installation.md)
- [Ingress - Zur Installationsanleitung](/docs/pods/ingress/installation.md)

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

### Weitere Quellen
- [Hier kommen Online-Quellen oder ggf. Bücher hin]

# Struktur der Präsentation
> Gemäss erhaltener Aufgabenstellung
- Infrastruktur (schematisch)
- Verwendete Softwarekomponenten einzeln vorstellen
- Einzelne Schritte des Deployments und involvierte Infrastrukturen
- Jedes Gruppenmitglied muss vortragen
