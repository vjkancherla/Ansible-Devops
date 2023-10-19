#!/bin/bash

# Find and kill all kubectl port-forward processes
pkill -f "kubectl port-forward"

# Delete all Test Kubernetes resources
kubectl delete -f test-deployment.yaml
