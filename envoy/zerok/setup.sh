# actions: 
#   reset  - reset minikube and start with volume mount
#   apply  - (default) sets up configs, services and pods
#   fwd    - Start port forwarding
#   delete - delete setup

MOUNT_PATH="$(pwd)/taps"
DEFAULT_ACTION="apply"
action="${1:-$DEFAULT_ACTION}"
echo $action


kubectl $action -k ./

