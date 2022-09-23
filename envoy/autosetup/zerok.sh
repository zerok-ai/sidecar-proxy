DEFAULT_ACTION='apply'
action="${1:-$DEFAULT_ACTION}"

kubectl get deployment nginx-deployment -o yaml > base/deployment.yaml
kubectl get configmap target --namespace=default -o yaml > base/configmap.yaml

# kubectl delete configmap envoy-log-taps
# kubectl create configmap envoy-log-taps --from-file=./taps

kubectl $action -k common;
kubectl $action -k listener
kubectl $action -k collector
