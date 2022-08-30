
kubectl delete -f httpbin.yaml

cd proxy
# minikube image rm zerok/amazing-proxy
docker image rm zerok/amazing-proxy

docker build --no-cache -t zerok/amazing-proxy -f Dockerfile .
minikube image load zerok/amazing-proxy --overwrite=true --daemon
cd ..

cd init
minikube image rm zerok/init-networking
docker image rm zerok/init-networking

docker build --no-cache -t zerok/init-networking -f Dockerfile .
minikube image load zerok/init-networking --overwrite=true --daemon
cd ..

kubectl apply -f httpbin.yaml
