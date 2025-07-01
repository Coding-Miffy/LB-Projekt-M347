# Arbeitsjournal
**Autor:in**: Max.Ebbinghaus  
**Datum**: 01.07.2025    
**Version**: 1.7  

# Arbeitsprotokoll 

| Datum       | Tätigkeit                                              | Bemerkung |
|-------------|---------------------------------------------------------|-----------|
| 24.06.2025  | Planung Redmine/WordPress           | Ersteindruck gewinnen |
| 25.06.2025  | Aufbau Redmine              | Erste Versuche |
| 25.06.2025  | Aufbau Redmine            | |
| 26.06.2025  | Aufbau Redmine          |  |
| 26.06.2025  | Erstellung aller YAML-Dateien für Redmine Endgültige Version          | Deployments, Services, PVCs, ConfigMaps & Secrets vollständig |
| 27.06.2025  | Aufbau der Redmine-Infrastruktur im Cluster             | Alle Ressourcen angewendet und getestet |
| 27.06.2025  | Aufbau WordPress       |  |
| 28.06.2025 | Aufsetzen der WordPress-Konfiguration (YAML-Files)         | Alle YAML-Dateien (Deployment, Services, PVCs, ConfigMap, Secret) erstellt |
| 29.06.2025  | Verfassen der Installationsanleitung für Redmine       | Schrittweise Anleitung in Markdown für Git |
| 29.06.2025  | Detaillierte Erklärung der Redmine-YAML-Konfiguration  | Alle Dateien inkl. Zweck und Struktur erklärt |
| 29.06.2025  | Definition und Umsetzung der Redmine-Testfälle         | Testplan & Protokoll erstellt (Ingress, Login, Datenbank etc.) |
| 29.06.2025 | Verfassen der Dokumentation für WordPress        | Strukturierung und detaillierte Dokumentation der Ressourcen, Installation und Besonderheiten |
| 30.06.2025  | Durchführung der Tests für Redmine                     | Alle Tests erfolgreich durchlaufen |
| 30.06.2025 | Erstellung des Testplans und Durchführung der Tests für WordPress | Alle Testfälle erfolgreich durchgeführt, Ergebnisse protokolliert          |
| 01.07.2025  | Finalisieren der Redmine-Dokumentation                 | Für Git-Übergabe & Präsentation vorbereitet |



## Herausforderungen

Zu Beginn des Projekts war die grösste Herausforderung für mich, dass sowohl Redmine als auch WordPress mir völlig unbekannte Anwendungen waren. Die Komplexitaet der beiden Tools und die Tatsache, dass ich keinerlei Vorkenntnisse zu ihrer Einrichtung und Verwaltung hatte, führten zu einer anfänglichen Überforderung. Besonders schwierig war, dass ich zusätzlich noch wenig Erfahrung im Umgang mit Kubernetes und Docker mitbrachte.

Die ersten Tage waren geprägt von intensivem Brainstorming und einer gründlichen Einarbeitung in die verschiedenen Komponenten. Ich musste zunächst ein grundlegendes Verständnis für die Funktionsweise und Interaktion der Anwendungen im Zusammenspiel mit Kubernetes-Clustern, Pods, Services und Persistent Volumes aufbauen. Vor allem die Unterscheidung der jeweils erforderlichen Konfigurationen und das korrekte Setup der Container erwiesen sich dabei als anspruchsvoll.

Ein weiteres Problem war die notwendige persistente Speicherung der Daten beider Applikationen. Es galt sicherzustellen, dass Nutzerdaten und Konfigurationen bei einem Neustart oder einer Skalierung der Pods nicht verloren gehen. Die Einrichtung der Persistent Volumes (PVCs) erforderte genaue Recherchen und mehrfaches Testen, bis schliesslich eine zuverlässige Lösung gefunden war.

Auch die Verwendung von ConfigMaps und Secrets zur sicheren und flexiblen Konfiguration der Anwendungen brachte zusätzliche Herausforderungen mit sich. Insbesondere die korrekte Übergabe und Nutzung von Umgebungsvariablen in beiden Applikationen benötigte einige Versuche und Anpassungen.

Trotz der anfänglichen Schwierigkeiten konnte ich durch intensives Testen, wiederholte Fehleranalyse und stetiges Experimentieren schrittweise mein Wissen erweitern.

## Reflexion

Neben den technischen Aspekten war das Projekt insbesondere in Bezug auf die Dokumentation eine grosse Lernerfahrung für mich.

Vor dem Projekt hatte ich noch wenig Erfahrung mit Git und der strukturierten Dokumentation mittels Markdown. Anfangs war es herausfordernd, sich in diese neuen Werkzeuge einzuarbeiten und sie effektiv einzusetzen. Im Laufe des Projekts konnte ich jedoch meine Kenntnisse in Git deutlich erweitern.

Besonders begeistert hat mich dabei die Verwendung von Markdown zur Dokumentation. Die einfache, klare Syntax und die Möglichkeit, Inhalte schnell übersichtlich darzustellen, haben mir sehr gefallen. Ich empfand es als grosse Bereicherung, Projektfortschritte strukturiert festzuhalten und Änderungen nachvollziehbar zu dokumentieren.

Insgesamt hat das Projekt mein Verständnis für strukturierte und nachvollziehbare Dokumentation deutlich verbessert und meine Motivation gesteigert, auch zukünftige Projekte mithilfe von Markdown übersichtlich und effektiv zu dokumentieren.

## Persönliches Fazit

Rückblickend betrachtet war das Projekt für mich eine besonders wertvolle Erfahrung. Trotz des anfänglich gigantisch wirkenden Umfangs und der vielen neuen Herausforderungen konnte ich enorm viel lernen und über mich hinauswachsen.

Mit jedem gemeisterten Problem und jeder erfolgreichen Aufgabe wuchs meine Motivation, und letztendlich entwickelte ich sogar echten Spass an der Arbeit und den Herausforderungen des Projekts. Das Gefühl, am Ende ein umfangreiches und anspruchsvolles Projekt erfolgreich abschliessen zu können, war sehr bereichernd und motivierend für meine weitere Entwicklung.

