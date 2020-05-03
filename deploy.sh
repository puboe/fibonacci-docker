#!/bin/sh

docker build -t pablodu92/docker-fibonacci-client:latest -t pablodu92/docker-fibonacci-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t pablodu92/docker-fibonacci-server:latest -t pablodu92/docker-fibonacci-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t pablodu92/docker-fibonacci-worker:latest -t pablodu92/docker-fibonacci-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push pablodu92/docker-fibonacci-client
docker push pablodu92/docker-fibonacci-server
docker push pablodu92/docker-fibonacci-worker

docker push pablodu92/docker-fibonacci-client:$GIT_SHA
docker push pablodu92/docker-fibonacci-server:$GIT_SHA
docker push pablodu92/docker-fibonacci-worker:$GIT_SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=pablodu92/docker-fibonacci-server:$GIT_SHA
kubectl set image deployments/client-deployment client=pablodu92/docker-fibonacci-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=pablodu92/docker-fibonacci-worker:$GIT_SHA