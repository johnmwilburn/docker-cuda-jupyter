**README**

This repository contains scripts to build and utilize a CUDA-PyTorch enabled Jupyter Lab environment via SSH with easy extensibility for libraries such as Hugging Face transformers. The scripts are configurd to bind the Docker container to localhost on the remote machine after establishing an SSH tunnel to prevent the deployed container from listening for other connections. 

1. **config.json**:
   - This JSON file stores configuration variables used by the other scripts. You should populate it with the necessary values such as `UserName`, `RemoteHost`, and `ImageName`.
  
2. **requirements.txt**:
   - This requirements file specifies any additional libraries to install besides CUDA-PyTorch. To update, add requirements here then re-run the build script(s).

2. **build-on-remote.ps1** and **build-on-remote.sh**:
   - These scripts are used to SCP a Dockerfile from the current directory to the specified remote host and then build a Docker image using the Dockerfile. They read the configuration from `config.json` and require `Dockerfile` to be present in the same directory.

3. **host-on-remote.ps1** and **host-on-remote.sh**:
   - These scripts SSH into the specified remote host and start hosting the Docker container. They pull the Docker image specified in `config.json` and run it on the remote host.
