DEFAULT_CLOUD_PROVIDER="gke"

helpFunction()
{
   echo ""
   echo -e "Usage: ./install.sh [eks|gke]"
   echo ""
   exit 1 # Exit script after printing help
}

clusterProvider="${1:-$DEFAULT_CLOUD_PROVIDER}"

# install cluster
sh ./$clusterProvider/install.sh

# install loadtest
# kubectl apply -f httpbin.yaml

