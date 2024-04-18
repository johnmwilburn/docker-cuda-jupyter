This repository contains scripts to remotely build, host, and connect to a PyTorch (CUDA) Jupyter Lab environment on another machine. It communicates over SSH and offers easy extensibility for additional libraries. The server hosted only listens for incoming connections on the remote machine's local host

scripts are configured to bind the Docker container to localhost on the remote machine after establishing an SSH tunnel to prevent the deployed container from listening for other connections. 

**USAGE**
1. Rename config.json.example to config.json and populate its variables
2. Add any additionally desired libraries to requirements.txt. The only default library is PyTorch (CUDA).
3. Run either build-on-remote.ps1 or build-on-remote.sh per your terminal preferences. This builds the image on the remote machine and only needs to be run initially / after adding additional libraries.
4. Run either host-on-remote.ps1 or host-on-remote.sh per your terminal preferences. This runs the image as a container and needs to be run every time you wish to start the Jupyter server.
5. Connect to localhost:<LocalPort> in your browser and log in using the token output during the previous step. You can also configure a password which will persist through container restarts.

**USAGE**
1. **config.json**:
   - This JSON file stores configuration variables used by the other scripts. You should populate it with the necessary values such as `UserName`, `RemoteHost`, and `ImageName`.
  
2. **requirements.txt**:
   - This requirements file specifies any additional libraries to install besides CUDA-PyTorch. To update, add requirements here then re-run the build script(s).

2. **build-on-remote.ps1** and **build-on-remote.sh**:
   - These scripts are used to SCP a Dockerfile from the current directory to the specified remote host and then build a Docker image using the Dockerfile. They read the configuration from `config.json` and require `Dockerfile` to be present in the same directory.

3. **host-on-remote.ps1** and **host-on-remote.sh**:
   - These scripts SSH into the specified remote host and start hosting the Docker container. They pull the Docker image specified in `config.json` and run it on the remote host.
