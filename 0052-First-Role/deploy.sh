#!/bin/bash

# Command 1: Create a Kubernetes resource
kubectl create -f test-deployment.yaml

# Function to check if all pods are running
wait_for_pods() {
    namespace="default"
    desired_pods=("app-server-1" "app-server-2" "db-server-1")

    for pod in "${desired_pods[@]}"; do
        while true; do
            pod_status=$(kubectl get pods -n "$namespace" "$pod" -o jsonpath='{.status.phase}')
            if [ "$pod_status" == "Running" ]; then
                echo "Pod $pod is now running."
                break
            else
                echo "Waiting for pod $pod to be in the Running state..."
                sleep 5  # Adjust the sleep interval as needed
            fi
        done
    done
}

# Call the function to wait for pods
wait_for_pods

# Command 2: Port-forward to svc/app-svc-1
kubectl port-forward svc/app-svc-1 2222:2222 &

# Command 3: Port-forward to svc/app-svc-2
kubectl port-forward svc/app-svc-2 2322:2322 &

# Command 4: Port-forward to svc/db-svc-1
kubectl port-forward svc/db-svc-1 2422:2422 &
