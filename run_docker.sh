#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
# TAG=image_name:version
TAG=udacity-pfour:v2
docker build --tag=$TAG .
# Step 2: 
# List docker images
docker image ls
# Step 3:iii 
# Run flask app
docker run -p 0.0.0.0:8000:80 $TAG
