# actions: 
#   reset  - reset minikube and start with volume mount
#   apply  - (default) sets up configs, services and pods
#   fwd    - Start port forwarding
#   delete - delete setup

MOUNT_PATH="$(pwd)/taps"
DEFAULT_ACTION="apply"
action="${1:-$DEFAULT_ACTION}"
echo $action

if [ $action = "reset" ]; then
    minikube stop
    minikube delete
    minikube start --mount-string=$MOUNT_PATH --mount
    exit 0
fi

if [ $action = "fwd" ]; then
    kubectl port-forward ingress 8080:8080
    exit 0
fi

kubectl $action -f namespace.yaml
kubectl $action -f pod_collector.yaml
kubectl $action -f collector-envoy-config.yaml

kubectl $action -f ingress-envoy-config.yaml
kubectl $action -f pod_service.yaml
kubectl $action -f service.yaml

