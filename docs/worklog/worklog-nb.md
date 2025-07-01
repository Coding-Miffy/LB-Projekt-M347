# Arbeitsjournal
**Autor:in**: Natascha Blumer  
**Datum**: 01.07.2025    
**Version**: 1.0  

## Arbeitsprotokoll
| Datum | Tätigkeit | Bemerkung |
| :-- | :-- | :-- |
| 18.06.2025 | Aufsetzen der Dokumentation |  |
| 18.06.2025 | Entwerfen des Infrastrukturdiagramms | Ich habe wiederholt Feedback von Yves eingeholt |
| 19.06.2025 | Dokumentation zur Infrastruktur verfasst |  |
| 19.06.2025 | Ordnerstruktur und Files erstellt |  |
| 23.06.2025 | Überarbeitung des Infrastrukturdiagramms und der dazugehörigen Dokumentation |  |
| 24.06.2025 | Erstellung der Templates für die Arbeitsjournale, Testkonzepte & Konfiguration |  |
| 25.06.2025 | Überarbeitung des Infrastrukturdiagramms und der dazugehörigen Dokumentation | Jira mit Redmine ersetzt |
| 25.06.2025 | Konfiguration und Installation von MediaWiki | Alle Files ausser `LocalSettings.php` |
| 25.06.2025 | Konfiguration und Installation von Ingress | Ingress-Klasse + erstes Ingress-File |
| 26.06.2025 | Konfiguration und Installation von `LocalSettings.php` | Zur Konfiguration von MediaWiki |
| 26.06.2025 | Verfassen der Installationsanleitung für MediaWiki |  |
| 26.06.2025 | Konfiguration und Installation von Ingress | Restliche Files |
| 26.06.2025 | Verfassen des Testkonzepts für MediaWiki |  |
| 26.06.2025 | Durchführen der Tests für MediaWiki |  |
| 27.06.2025 | Verfassen der Konfigurationsdetails für MediaWiki |  |
| 27.06.2025 | Verfassen der Installationsanleitung für Ingress |  |
| 27.06.2025 | Verfassen der Konfigurationsdetails für Ingress |  |
| 27.06.2025 | Verfassen des Testkonzepts für Ingress |  |
| 28.06.2025 | Durchführen der Tests für Ingress |  |
| 30.06.2025 | Erstellen der Batch-Skripte | Für die automatisierte Installation und Deinstallation |
| 01.07.2025 | Fertigstellen der Gesamtdokumentation |  |
| 01.07.2025 | Vorbereiten der Live-Demo | Für die Projekt-Präsentation |

## Herausforderungen
Zu Beginn war das Projekt sehr überfordernd und wirkte deutlich komplexer und umfangreicher, als es der bisherige Unterricht erwarten liess. Es war zunächst viel Brainstorming und ein intensives Studium der einzelnen Komponenten nötig, um überhaupt einen geeigneten Einstieg in die Thematik zu finden und das Projekt richtig anzugehen.

Viele der verwendeten Tools und Technologien waren mir zu Projektstart völlig unbekannt. So musste ich mir zunächst ein grundlegendes Verständnis für die Funktionsweise von Helm, Ingress, den einzelnen Pods und den damit verbundenen Services und PVCs erarbeiten.

Ein besonders grosser Stolperstein war die erste Umsetzung mit Jira. Die Installation war sehr umständlich und fehleranfällig. Die Erkenntnis, dass Jira zum heutigen Zeitpunkt nicht mehr geeignet ist (u. a. aufgrund von Lizenzbeschränkungen), war ein entscheidender Wendepunkt. Der Wechsel zu Redmine war eine wichtige Entscheidung, die den Aufwand erheblich reduzierte und das Projekt deutlich zugänglicher machte.

Auch die Installation und Konfiguration von MediaWiki stellte eine spezielle Herausforderung dar. Obwohl die Software grundsätzlich weiterhin aktuell ist, war die Integration der `LocalSettings.php` im Containerbetrieb komplex. Da der Pfad `/var/www/html/` nicht persistent ist, muss die Datei nach einem Neustart des Pods immer wieder manuell hineinkopiert werden. Diese Besonderheit erforderte eine genaue Analyse und setzt auch künftig eine manuelle Nacharbeit voraus.

Der Einsatz von Ingress, insbesondere dessen Installation via Helm, brachte zusätzliche Schwierigkeiten mit sich. Erst durch wiederholtes Testen konnte ich eine zuverlässige Lösung erreichen.

Durch diese intensiven technischen Herausforderungen konnte ich aber ein nachhaltiges Verständnis für die Materie entwickeln, das über das eigentliche Modul hinausgeht.

## Reflexion
Neben den technischen Aspekten war das Projekt auch in sozialer und organisatorischer Hinsicht eine grosse Lerngelegenheit.

Die Arbeit in einer Dreiergruppe stellte hohe Anforderungen an Koordination, Kommunikation und Abstimmung. Ich konnte mich während des Projekts stark in der Zeitplanung einbringen und habe dabei eine leitende Rolle übernommen. Diese Aufgabe half mir, meine Führungskompetenzen zu stärken und gleichzeitig meine Fähigkeit, Verantwortung abzugeben, zu trainieren.

Ich neige grundsätzlich dazu, Arbeiten lieber selbst zu erledigen, um volle Kontrolle über Zeitplanung und Ergebnis zu behalten. In diesem Projekt konnte ich jedoch üben, Aufgaben zu delegieren und Vertrauen ins Team zu entwickeln. Auch wenn mir das nicht immer leichtfiel und es nicht in allen Situationen perfekt gelang, war es eine wertvolle Übung und ein grosser persönlicher Fortschritt.

Darüber hinaus konnte ich meine Fähigkeit, komplexe Sachverhalte verständlich zu dokumentieren, stark verbessern. Das Projekt erforderte eine umfassende und präzise Dokumentation, was meine Skills im technischen Schreiben deutlich erweitert hat.

Besonders motivierend war, dass ich mein Wissen im Laufe des Projekts an meine Teamkollegen und an Mitschüler:innen weitergeben konnte. Das hat nicht nur mein eigenes Verständnis gefestigt, sondern auch meine Freude an der Arbeit mit komplexen IT-Systemen gesteigert.

# Persönliches Fazit
Das Projekt war für mich eine intensive, fordernde und gleichzeitig unglaublich bereichernde Erfahrung.

Ich habe gelernt, dass auch scheinbar überwältigende Aufgaben in machbare Schritte zerlegt werden können, wenn man sich strukturiert und mit genügend Geduld herantastet. Mein technisches Wissen, insbesondere zu Kubernetes, Containern und Monitoring, konnte ich dadurch nicht nur ausbauen, sondern in einem praxisnahen Szenario festigen.

Auf persönlicher Ebene habe ich gelernt, dass effektive Teamarbeit nicht nur bedeutet, Aufgaben zu verteilen, sondern auch Vertrauen in andere aufzubauen und gemeinsam Lösungen zu erarbeiten.

Abschliessend bin ich stolz darauf, dass ich trotz anfänglicher Überforderung so viel Eigenständigkeit, Engagement und Durchhaltevermögen zeigen konnte. Ich konnte nicht nur mein technisches Know-how, sondern auch meine sozialen und organisatorischen Kompetenzen erweitern, Fähigkeiten, die mir auch in zukünftigen Projekten wertvoll dienen werden.
