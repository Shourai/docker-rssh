# RSSH

Simple and minimal restricted secure shell for SFTP, SCP and RSYNC.

This image can be downloaded from dockerhub
```
docker pull shourai/docker-rssh
```

## Examples

### Single user 

```
  docker run -d \
  -v $(pwd)/data:/home/<username> \
  -e username=<username> -e password=<password> \
  -p 2222:22 \
  --name rssh shourai/docker-rssh
```

#### Logging in

The OpenSSH server runs by default on port 22, and in this example, we are
forwarding the container's port 22 to the host's port 2222. To log in with an
OpenSSH client, run: `sftp -P 2222 foo@<host-ip>`, `sftp -P 2222 <SRC> <DST>` or
`rsync -e 'ssh -p 2222' <SRC> <DST>`


### Using SSH key

Create the file `/home/<user>/.ssh/authorized_keys` in a mounted directory or mount the file 
at this location.
The standard username is `canary`

```
docker run -d \
    -v $HOME/.ssh/authorized_keys:/home/<username>/.ssh/authorized_keys:ro \
    -v $(pwd)/data:/home/<username> \
    -p 2222:22 \
    --name rssh shourai/docker-rssh
```
