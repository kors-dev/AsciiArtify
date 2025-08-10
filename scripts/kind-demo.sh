#!/usr/bin/env bash
set -euo pipefail
CLUSTER=ascii-kind
kind create cluster --name "$CLUSTER"
kubectl apply -f k8s/hello/
kubectl rollout status deploy/hello
kubectl get svc hello
echo "Kind demo running on http://localhost:8081"
kubectl port-forward svc/hello 8081:80
# Press Ctrl+C to stop port-forward
# kind delete cluster --name "$CLUSTER"

