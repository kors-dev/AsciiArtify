#!/usr/bin/env bash
set -euo pipefail
PROFILE=ascii-minikube
minikube start --driver=docker --profile "$PROFILE"
kubectl apply -f k8s/hello/
kubectl rollout status deploy/hello
kubectl get svc hello
echo "Minikube demo running on http://localhost:8082"
kubectl port-forward svc/hello 8082:80
# Press Ctrl+C to stop port-forward
# minikube delete --profile "$PROFILE"


