# actions: 
#   reset  - reset minikube and start with volume mount
#   apply  - (default) sets up configs, services and pods
#   fwd    - Start port forwarding
#   delete - delete setup

MOUNT_PATH="$(pwd)/autosetup/taps"
MOUNT_LOCATION="/var/log"

DEFAULT_ACTION="apply"
action="${1:-$DEFAULT_ACTION}"
echo $action

if [ $action = "reset" ]; then
    minikube stop
    minikube delete
    minikube start --mount-string=$MOUNT_PATH:$MOUNT_LOCATION --mount
    exit 0
fi

if [ $action = "fwd" ]; then
    minikube service target --url
    exit 0
fi

kubectl $action -k target_service
