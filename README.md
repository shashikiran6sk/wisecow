# WiseCow Project

## Overview
The WiseCow project is a simple server that serves wisdom (quotes) on a specified port. It uses the `cowsay` and `fortune` utilities to generate and serve the wisdom.

## Prerequisites
The project requires the following utilities:
- `cowsay`
- `fortune`

You can install these utilities using the following command:

`sudo apt update`
`sudo apt install fortune-mod cowsay -y`

Usage
To use the project, run the wisecow.sh script:

`./wisecow.sh`

Then, point your browser to the server port (default is 4499).

Docker and GitHub Actions
The project includes a Dockerfile for building a Docker image of the project.

`docker build -t wisecow .`

`docker run -d -p 4499:4499 wisecow`

It also includes GitHub Actions workflows for building the Docker image, deploying it to Docker Hub, and deploying it to a Kubernetes cluster.

Github secrets 

`DOCKER_USERNAME`

`DOCKER_PASSWORD`

`KUBECONFIG`

Additional Scripts
The repository also includes additional scripts for system health monitoring ``(system_health_monitor.sh)`` and log file analysis ``(log_file_analyzer.sh).``