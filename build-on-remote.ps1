# Read variables from config.json
$config = Get-Content -Raw -Path "config.json" | ConvertFrom-Json

# Assign variables
$UserName = $config.UserName
$RemoteHost = $config.RemoteHost
$ImageName = $config.ImageName

# SCP Dockerfile to remote host
scp -r Dockerfile requirements.txt "${UserName}@${RemoteHost}:~/"

# SSH into remote host and build Docker image
ssh "${UserName}@${RemoteHost}" "mkdir ~/tmp-build && cp Dockerfile requirements.txt ~/tmp && docker build -t ${ImageName} ~/tmp-build && rm -rf ~/tmp-build"
