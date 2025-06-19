>[!IMPORTANT]
>Hoi zäme!
>In diesem Markdown habe ich mal die Eckpfeiler für Doku und Präsi erfasst, dass uns nichts untergeht :)  
>Im Ordner `Projekt` habe ich mal eine ungefähre Ordner-/Datei-Struktur aufgesetzt, mit Dummy-Files. Natürlich alles noch nicht fix, einfach mal für den Überblick.

# Struktur der Projektdokumentation
> Gemäss erhaltener Aufgabenstellung
- *Titelblatt*
- *Inhaltsverzeichnis*
- *Verwendete Technologien*
- *Anwendungsbeispiel*

## Infrastruktur
- Diagramm
- Auseinandersetzung und Entscheidungsfindung: Warum hat man sich wofür entschieden
  - Anzahl PVC
  - Welche Services und warum
  - Ingress Controller (z. B. nginx)
  - Replicas
    - Beispiel: Wir setzen in diesem Projekt `replicas: 1`, da die Hochverfügbarkeit auf einem Single-Node-Cluster keinen praktischen Nutzen bringt. In einer produktiven Umgebung würden wir z. B. WordPress mit `replicas: 2` oder mehr betreiben.

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

## Arbeitsjournal
- NB
- ME
- SR

## Persönliches Fazit
- NB
- ME
- SR

## Hilfestellungen
Notizen:
- Unterstützung von Yves zur Infrastruktur

# Struktur der Präsentation
> Gemäss erhaltener Aufgabenstellung
- Infrastruktur (schematisch)
- Verwendete Softwarekomponenten einzeln vorstellen
- Einzelne Schritte des Deployments und involvierte Infrastrukturen
- Jedes Gruppenmitglied muss vortragen
