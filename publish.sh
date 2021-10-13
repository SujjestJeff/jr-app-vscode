#!/bin/sh
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 658681744708.dkr.ecr.us-west-2.amazonaws.com 
docker build -t jr-app-vscode .
docker tag jr-app-vscode:latest 658681744708.dkr.ecr.us-west-2.amazonaws.com/jr-app-vscode:latest 
docker push 658681744708.dkr.ecr.us-west-2.amazonaws.com/jr-app-vscode:latest