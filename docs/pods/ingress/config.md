>[!IMPORTANT]
>In diesem File muss noch die Konfiguration der `[name]-ingress.yaml`-Files erklärt werden.

# Konfiguration - Ingress Controller
[Einleitung]

- **Verwendung**:
- **Einsatzgrund**:
- **Rolle im System**:

## Ressourcen - Anwendung
Im Folgenden ist die zentrale Ressource aufgeführt, welche die Ingress-Klasse und Konfiguration des Controllers definiert.

| Ressource | Dateiname | Zweck |
| :-- | :-- | :-- |
| IngressClass & Deployment | `ingress-class.yaml` | Installiert und konfiguriert den Ingress Controller |

## Files
### IngressClass & Controller-Deployment
>Installiert den Ingress Controller im Cluster (z. B. mit nginx) und registriert ihn unter einer benannten Klasse. Diese Klasse wird später von den einzelnen Ingress-Ressourcen referenziert.

[Hier kommen die Konfigurationsdetails]
```yaml
# ingress-class.yaml
```

## Besonderheiten & Herausforderungen
[Hier kommt ein Fazit zur Konfiguration und ggf. Herausforderungen]

