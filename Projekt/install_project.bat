echo Minikube starten
minikube start

echo Redmine installieren
kubectl create namespace m347-redmine
kubectl apply -f redmine/configmap.yaml
kubectl apply -f redmine/secret.yaml
kubectl apply -f redmine/db-configmap.yaml
kubectl apply -f redmine/db-secret.yaml
kubectl apply -f redmine/db-pvc.yaml
kubectl apply -f redmine/pvc.yaml
kubectl apply -f redmine/db-deployment.yaml
kubectl apply -f redmine/deployment.yaml
kubectl apply -f redmine/db-service.yaml
kubectl apply -f redmine/service.yaml

echo MediaWiki installieren
kubectl create namespace m347-mediawiki
kubectl apply -f mediawiki/configmap.yaml
kubectl apply -f mediawiki/secret.yaml
kubectl apply -f mediawiki/db-pvc.yaml
kubectl apply -f mediawiki/pvc.yaml
kubectl apply -f mediawiki/db-deployment.yaml
kubectl apply -f mediawiki/deployment.yaml
kubectl apply -f mediawiki/db-service.yaml
kubectl apply -f mediawiki/service.yaml
:: LocalSettings.php?

echo WordPress installieren
kubectl create namespace m347-wordpress
kubectl apply -f wordpress/configmap.yaml
kubectl apply -f wordpress/secret.yaml
kubectl apply -f wordpress/db-pvc.yaml
kubectl apply -f wordpress/pvc.yaml
kubectl apply -f wordpress/db-deployment.yaml
kubectl apply -f wordpress/deployment.yaml
kubectl apply -f wordpress/db-service.yaml
kubectl apply -f wordpress/service.yaml

echo Prometheus installieren
kubectl create namespace m347-prometheus
kubectl apply -f monitoring/prometheus/configmap.yaml
kubectl apply -f monitoring/prometheus/secret.yaml
kubectl apply -f monitoring/prometheus/pvc.yaml
kubectl apply -f monitoring/prometheus/deployment.yaml
kubectl apply -f monitoring/prometheus/service.yaml
kubectl apply -f monitoring/prometheus/blackbox-exporter-deployment.yaml

echo Grafana installieren
kubectl create namespace m347-grafana
kubectl apply -f monitoring/grafana/configmap.yaml
kubectl apply -f monitoring/grafana/secret.yaml
kubectl apply -f monitoring/grafana/pvc.yaml
kubectl apply -f monitoring/grafana/data-provisioning.yaml
kubectl apply -f monitoring/grafana/deployment.yaml
kubectl apply -f monitoring/grafana/service.yaml

echo Ingress installieren
cd software
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
kubectl create namespace ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx
kubectl apply -f ../ingress/ingress-class.yaml
kubectl apply -f ../ingress/redmine-ingress.yaml
kubectl apply -f ../ingress/mediawiki-ingress.yaml
kubectl apply -f ../ingress/wordpress-ingress.yaml
kubectl apply -f ../ingress/prometheus-ingress.yaml
kubectl apply -f ../ingress/grafana-ingress.yaml

pause



