# Installation von WordPress

Nach der abgeschlossenen Konfiguration der YAML-Files kann WordPress gemeinsam mit der zugehörigen Datenbank in Kubernetes deployt werden. Diese Anleitung beschreibt die nötigen Schritte für die erstmalige Installation.

### Voraussetzungen:

- Alle notwendigen Ressourcen befinden sich im Verzeichnis `Projekt/wordpress`.
- Minikube läuft, und der Cluster ist gestartet.

> [!NOTE]  
> Die Konfiguration (`wp-config.php`) ist bereits vollständig über Umgebungsvariablen in den YAML-Dateien definiert. Ein manueller Setup-Prozess im Browser ist **nicht erforderlich**.

## 1. Namespace erstellen

Zuerst wird ein eigener Namespace für WordPress erstellt. Dies ermöglicht eine saubere Trennung zu anderen Anwendungen im Cluster.

```powershell
kubectl create namespace m347-wordpress

