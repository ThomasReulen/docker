#!/bin/bash

help () {

    echo "--------------------------------------------------------------------------------------------"
    echo ""
    echo "start script for dev environment. usage: "
    echo ""
    echo "start.sh [OPTIONS] CONTEXT"
    echo ""
    echo "OPTIONS:"
    echo "      -h|--help                     display help" 
    echo "      -b|--build                    force build images fresh"
    echo "      -i|--with-base-img            build with base images"
    echo "      -p|--prune                    prune before starting"
    echo "      -a|--all                      force build images and prune, combines all params"
    echo ""
    echo "--------------------------------------------------------------------------------------------"

}

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
REPO_ROOT_DIR="$(cd "$SCRIPT_DIR/../"; pwd)/"

POSITIONAL_ARGS=()

BUILD=NO
BUILD_BASEIMG=NO
HELP=NO
ALL=NO
PRUNE=NO

echo ""
while [[ $# -gt 0 ]]; do  
  case $1 in
    -b|--build)
      BUILD=YES
      shift # past argument
      ;;
    -h|--help)
      HELP=YES
      shift # past argument
      ;;
    -p|--prune)
      PRUNE=YES
      shift # past argument
      ;;
    -i|--with-base-image)
      BUILD_BASEIMG=YES
      shift # past argument
      ;;    
    -a|--all)
      ALL=YES
      shift # past argument
      ;;    
    # -s|--searchpath)
    #   SEARCHPATH="$2"
    #   shift # past argument
    #   shift # past value
    #   ;;
    -*|--*)
      echo "Unknown option $1"
      help
      exit 1
      ;;
    *)            
      POSITIONAL_ARGS+=("$1") # save positional arg      
      shift # past argument
      ;;
  esac
done

# context first positional arg
CTX=${POSITIONAL_ARGS[0]}

# echo ""
# echo "--------------------------------------------------------------------------------------------"
# echo "--------------------------------------------------------------------------------------------"
# echo "starting dev environment with root context $REPO_ROOT_DIR"
# echo "BUILD: $BUILD"
# echo "WITH_BASEIMG: $WITH_BASEIMG"
# echo "CONTEXT: $CTX"
# # echo "POSITIONAL ARGS:"
# # echo ${POSITIONAL_ARGS[*]}
# echo "--------------------------------------------------------------------------------------------"
# echo "--------------------------------------------------------------------------------------------"

if [ "$HELP" == "YES" ]; then 
      help
      exit 0
fi 

if [ "$ALL" == "YES" ]; then         
    BUILD=YES
    BUILD_BASEIMG=YES
    PRUNE=YES
fi

# remove all running container
docker stop $(docker ps -a -q)

# remove temporary images and container
if [ "$PRUNE" == "YES" ]; then 
    docker system prune -f
fi

# check for rebuild base images
if [ "$BUILD_BASEIMG" == "YES" ]; then     
    docker build -f "${REPO_ROOT_DIR}go/Dockerfile-baseimage" -t cdk-go-baseimage ${REPO_ROOT_DIR}go/
fi

# run and re-build dev image for $1 
if [ "$BUILD" == "YES" ]; then    
    docker-compose -f "${REPO_ROOT_DIR}_compose/docker-compose.yaml" up $CTX -d --build
else
    docker-compose -f "${REPO_ROOT_DIR}_compose/docker-compose.yaml" up $CTX -d 
fi 

# attach into container 
docker exec -it $CTX bash



