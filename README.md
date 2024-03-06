**README**

This repository contains scripts to facilitate the deployment and management of Docker images on a remote host. Below is a brief explanation of the files included:

1. **config.json**:
   - This JSON file stores configuration variables used by the other scripts. You should populate it with the necessary values such as `UserName`, `RemoteHost`, and `ImageName`.

2. **build-on-remote.ps1** and **build-on-remote.sh**:
   - These scripts are used to SCP (Secure Copy Protocol) a Dockerfile from the current directory to the specified remote host and then build a Docker image using the Dockerfile. They read the configuration from `config.json` and require `Dockerfile` to be present in the same directory.

3. **host-on-remote.ps1** and **host-on-remote.sh**:
   - These scripts SSH into the specified remote host and start hosting the Docker container. They pull the Docker image specified in `config.json` and run it on the remote host. These scripts also require `config.json`.

To use these scripts:

1. Ensure that `config.json`, `Dockerfile`, and the desired scripts are in the same directory.
2. Populate `config.json` with the appropriate values for `UserName`, `RemoteHost`, and `ImageName`.
3. Execute the desired script (`build-on-remote.ps1` or `build-on-remote.sh`) to build the Docker image on the remote host.
4. Once the image is built, execute `host-on-remote.ps1` or `host-on-remote.sh` to run the Docker container on the remote host.

These scripts aim to simplify the process of deploying Docker images on remote hosts by abstracting away the manual steps involved in SCP and SSH commands, making it easier to automate deployment processes.
