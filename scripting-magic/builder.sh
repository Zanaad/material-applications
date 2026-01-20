#!/bin/sh

if [ $# -ne 2 ]; then 
    echo "Usage: $0 <GitHub-Repo> <Docker-Hub-Repo>"
    exit 1
fi

GITHUB_REPO=$1
DOCKER_HUB_REPO=$2

git clone https://github.com/$GITHUB_REPO.git

REPO_NAME=$(basename $GITHUB_REPO)

cd $REPO_NAME

echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin

docker build -t $DOCKER_HUB_REPO .

docker push $DOCKER_HUB_REPO

cd ..
rm -rf $REPO_NAME