# Arbeitsjournal
**Autor:in**:  
**Datum**:    
**Version**:  

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

Zu Beginn des Projekts war die groesste Herausforderung für mich, dass sowohl Redmine als auch WordPress mir völlig unbekannte Anwendungen waren. Die Komplexitaet der beiden Tools und die Tatsache, dass ich keinerlei Vorkenntnisse zu ihrer Einrichtung und Verwaltung hatte, fuehrten zu einer anfaenglichen èberforderung. Besonders schwierig war, dass ich zusaetzlich noch wenig Erfahrung im Umgang mit Kubernetes und Docker mitbrachte.

Die ersten Tage waren geprägt von intensivem Brainstorming und einer gründlichen Einarbeitung in die verschiedenen Komponenten. Ich musste zunächst ein grundlegendes Verständnis für die Funktionsweise und Interaktion der Anwendungen im Zusammenspiel mit Kubernetes-Clustern, Pods, Services und Persistent Volumes aufbauen. Vor allem die Unterscheidung der jeweils erforderlichen Konfigurationen und das korrekte Setup der Container erwiesen sich dabei als anspruchsvoll.

Ein weiteres Problem war die notwendige persistente Speicherung der Daten beider Applikationen. Es galt sicherzustellen, dass Nutzerdaten und Konfigurationen bei einem Neustart oder einer Skalierung der Pods nicht verloren gehen. Die Einrichtung der Persistent Volumes (PVCs) erforderte genaue Recherchen und mehrfaches Testen, bis schliesslich eine zuverlaessige Lösung gefunden war.

Auch die Verwendung von ConfigMaps und Secrets zur sicheren und flexiblen Konfiguration der Anwendungen brachte zusätzliche Herausforderungen mit sich. Insbesondere die korrekte èbergabe und Nutzung von Umgebungsvariablen in beiden Applikationen benötigte einige Versuche und Anpassungen.

Trotz der anfänglichen Schwierigkeiten konnte ich durch intensives Testen, wiederholte Fehleranalyse und stetiges Experimentieren schrittweise mein Wissen erweitern.

## Reflexion

# Persönliches Fazit
