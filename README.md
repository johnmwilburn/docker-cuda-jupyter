This repository contains scripts to remotely build, host, and connect to a PyTorch (CUDA) Jupyter Lab environment on another machine. It communicates over SSH and offers easy extensibility for additional libraries. After creating a tunnel between the local and remote host, the hosted Jupyter container is then configured to only listen for incoming connections from the remote machine's local host. This way, the hosted container is minimally accessible while still allowing remote access to the user of this repository. 

**USAGE**
1. Rename .env.example to .env and populate its variables
2. Add additional libraries to requirements.txt as needed
3. Run either build-on-remote.sh. This builds the image on the remote machine and only needs to be run initially / after adding additional libraries.
4. Run host-on-remote.sh. This tunnels to the remote host and runs the image as a container. This needs to be run every time you wish to start the Jupyter server.
5. Connect to localhost:<LocalPort> in your browser and log in using the token output during the previous step. You can also configure a password which will persist through container restarts.