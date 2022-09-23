deployment=nginx-deployment

kubectl label namespace default istio-injection=enabled --overwrite
# kubectl rollout restart deployment $deployment -n default
# kubectl label pods -n default -l "owner=zerok" "sidecar.istio.io/inject=false" --overwrite

listener=$(kubectl get pods --all-namespaces|grep $deployment|awk '{print $2}'|head -n 1)
echo $listener

kubectl label pod $listener -n default "owner=zerok" --overwrite
kubectl label pod $listener -n default "type=listener" --overwrite

