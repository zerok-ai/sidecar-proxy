function uploadImage {

    DockerFileHome=$1
    LOCATION="us-central1"
    PROJECT_ID="black-scope-358204"
    REPOSITORY="zerok-collector"
    IMAGE=$DockerFileHome
    TAG="latest"
    ART_Repo_URI="$LOCATION-docker.pkg.dev/$PROJECT_ID/$REPOSITORY/$IMAGE:$TAG"

    docker build -t $IMAGE $DockerFileHome

    docker tag $IMAGE $ART_Repo_URI

    gcloud auth configure-docker $LOCATION-docker.pkg.dev

    docker push $ART_Repo_URI
}

uploadImage init
# uploadImage proxy
