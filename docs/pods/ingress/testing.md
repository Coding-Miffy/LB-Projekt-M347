# Testplan - Ingress Controller
In diesem Abschnitt werden die geplanten Testfälle für den **Ingress Controller** dokumentiert. Ziel ist es, die Funktionalität der Komponente sicherzustellen.

## Testfälle
| Nr. | Komponente | Testfall | Testziel |
| :-: | :-- | :-- | :-- |
| I﻿-01 | Ingress | Zugriff auf MediaWiki | Sicherstellen, dass MediaWiki extern erreichbar ist |
| I﻿-02 | Ingress | Zugriff auf WordPress | Sicherstellen, dass WordPress extern erreichbar ist |
| I﻿-03 | Ingress | Zugriff auf Redmine | Sicherstellen, dass Redmine extern erreichbar ist |
| I﻿-04 | Ingress | Zugriff auf Prometheus | Sicherstellen, dass Prometheus extern erreichbar ist |
| I﻿-05 | Ingress | Zugriff auf Grafana | Sicherstellen, dass Grafana extern erreichbar ist |
| I﻿-06 | Ingress | `minikube tunnel` erforderlich | Sicherstellen, dass Ingress ohne aktiven Tunnel nicht von aussen funktioniert |
| I﻿-07 | Ingress | Falscher Hostname | Sicherstellen, dass ein falscher Hostname keinen Zugriff gewährt |

# Testprotokoll
Im Testprotokoll werden die ausgeführten Testfälle mit Beschreibung, Ergebnis und Bewertung festgehalten.

| Nr. | Testfall | Beschreibung | Erwartetes Ergebnis | Status |
| :-: | :-- | :-- | :-- | :-: |
| I﻿-01 | Zugriff auf MediaWiki | `http://mediawiki.m347.ch` im Browser aufrufen | Startseite von MediaWiki wird angezeigt | ✅ |
| I﻿-02 | Zugriff auf WordPress | `http://wordpress.m347.ch` im Browser aufrufen | Startseite von WordPress wird angezeigt | ✅ |
| I﻿-03 | Zugriff auf Redmine | `http://redmine.m347.ch` im Browser aufrufen | Startseite von Redmine wird angezeigt | ✅ |
| I﻿-04 | Zugriff auf Prometheus | `http://prometheus.m347.ch` im Browser aufrufen | Startseite von Prometheus wird angezeigt |  |
| I﻿-05 | Zugriff auf Grafana | `http://grafana.m347.ch` im Browser aufrufen | Startseite von Grafana wird angezeigt |  |
| I﻿-06 | `minikube tunnel` erforderlich | `minikube tunnel` stoppen und Browser aktualisieren | Alle Services sind nicht mehr erreichbar |  |
| I﻿-07 | Falscher Hostname | `http://foobar.m347.ch` im Browser aufrufen | Fehlerseite oder leere Antwort (kein Routing erfolgt) | ✅ |

## I-01: Zugriff auf MediaWiki
**Testdatum**: 28.06.2025  
**Tester:in**: Natascha Blumer  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://mediawiki.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Die MediaWiki-Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
- Die MediaWiki-Startseite erscheint ohne Fehlermeldung.

**Status**: ✅  
**Bemerkung**: *Keine*  

## I-02: Zugriff auf WordPress
**Testdatum**: 28.06.2025  
**Tester:in**: Natascha Blumer  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://wordpress.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Die WordPress-Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
- Die WordPress-Startseite erscheint ohne Fehlermeldung.

**Status**: ✅  
**Bemerkung**: *Keine*  

## I-03: Zugriff auf Redmine
**Testdatum**: 28.06.2025  
**Tester:in**: Natascha Blumer  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://redmine.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Die Redmine-Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
- Die Redmine-Startseite erscheint ohne Fehlermeldung.

**Status**: ✅  
**Bemerkung**: *Keine*  

## I-04: Zugriff auf Prometheus
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://prometheus.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Die Prometheus-Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
**Status**:   
**Bemerkung**:  

## I-05: Zugriff auf Grafana
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://grafana.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Die Grafana-Startseite erscheint ohne Fehlermeldung.

**Tatsächliches Verhalten**:  
**Status**:   
**Bemerkung**:  

## I-06: `minikube tunnel` erforderlich
**Testdatum**:  
**Tester:in**:  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` **nicht** aktiv ist
2. Im Browser die verschiedenen Dienste aufrufen

**Erwartetes Verhalten**:  
- Keiner der Dienste ist verfügbar.

**Tatsächliches Verhalten**:  
**Status**:   
**Bemerkung**:  

## I-07: Falscher Hostname
**Testdatum**: 28.06.2025  
**Tester:in**: Natascha Blumer  
**Beschreibung**:  
1. Sicherstellen, dass `minikube tunnel` aktiv ist
2. Im Browser `http://foobar.m347.ch` aufrufen

**Erwartetes Verhalten**:  
- Kein Routing erfolgt.
- Es erscheint eine Fehlerseite oder eine leere Antwort.

**Tatsächliches Verhalten**:  
- Kein Routing erfolgt.
- Es erscheint eine Fehlerseite.

**Status**: ✅  
**Bemerkung**: *Keine*  

## Legende - Statuswerte
Die folgende Legende dient zur Bewertung und schnellen Einschätzung der Testergebnisse:

| Symbol | Bedeutung |
| :-: | :-- |
| ✅ | Test erfolgreich bestanden |
| ⚠️ | Mit Einschränkungen bestanden |
| ❌ | Test fehlgeschlagen |
