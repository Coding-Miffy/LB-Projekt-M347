@echo off
echo Projekt deinstallieren

echo Stelle sicher, dass der Minikube-Tunnel gestoppt ist, bevor du fortfaehrst.
pause

echo Loeschen aller Namespaces
kubectl delete namespace ingress-nginx
kubectl delete ingressclass nginx
kubectl delete namespace m347-grafana
kubectl delete namespace m347-prometheus
kubectl delete namespace m347-wordpress
kubectl delete namespace m347-mediawiki
kubectl delete namespace m347-redmine

echo Alle Namespaces wurden geloescht.
pause