#!/usr/bin/env bash
set -euo pipefail
CLUSTER=ascii-k3d
k3d cluster create "$CLUSTER"
kubectl apply -f k8s/hello/
kubectl rollout status deploy/hello
kubectl get svc hello
echo "K3d demo running on http://localhost:8083"
kubectl port-forward svc/hello 8083:80
# Press Ctrl+C to stop port-forward
# k3d cluster delete "$CLUSTER"


