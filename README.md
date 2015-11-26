# Build fuse-nfs for Cloud Foundry rootfs

The goal of this project is to build the [`fuse-nfs`](https://github.com/sahlberg/fuse-nfs) and [`libnfs`](https://github.com/sahlberg/libnfs) for inclusion in your Cloud Foundry application.

## Requirements
- Docker: Since the build is performed using docker.

## Usage
```
gem install rake
rake build
```

The resulting files can be found in `./target`

## Using the binaries
Mounting a NFS share from for use by your application can be done by running:
```
/home/vcap/app/bin/fuse-nfs -n "nfs://{host}/{share}?uid={server_uid}&gid={server_gid}" -m /home/vcap/app/nfs
```

The above command should be invoked before the application is started.
This can be achieved with a wrapper script or with a pre-start script in [`.profiled.d`](https://devcenter.heroku.com/articles/profiled).

### Note about using NFS with non root users
By default, most NFS servers will only allow access from clients that are using a system port (i.e. a port < 1024).
Since these ports by default can only be used by the root user this will prevent non-root users from conencting to the NFS server or mounting the filesystem.
On Linux NFS servers this check can be disabled by adding the "insecure" keyword to the /etc/exports file.
