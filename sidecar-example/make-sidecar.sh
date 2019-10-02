#!/bin/bash

# Pull the Ubuntu image.
docker pull ubuntu

# Run the application container.
# Keep it open when examining.
docker run -dit ubuntu

# Run the container.
# Note: You need to get the process ID
docker ps -t | head -n 1

# Run the 'topz' sidecar in the same
# process namespace as the application
# container that we previously created.
docker run --pid=container:${ENTIRE_PROCESS_ID} -p 8080:8080 brendanburns/topz:db0fa58 /server --addr=0.0.0.0:8080

# Open the process health logs in the browser.
open -a "GoogleChrome" localhost:8080/topz
