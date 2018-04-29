# FileWave Server Docker Image

This Docker image runs a FileWave Server

# Settings

Several options are customizable using environment variables.

* ``FWSERVER_BACKUP``: If the FileWave provided backup script should run daily. Defaults to ``0``.


# Running the FileWave Server Container

```bash
$ docker pull nielshojen/filewaveserver
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  --net=host \
  nielshojen/filewaveserver
```

# Persisting the Server Data

The booster data lives in /fwxserver, config file lives in /usr/local/etc, different important files live in /usr/local/filewave and backup lives in /backup (if enabled) so mounting those to directories/files on the host would be a good idea and requires extra lines:
```bash
$ docker pull nielshojen/filewaveserver
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  --net=host \
  -v /local/host/folder/filewaveserver/data:/fwxserver \
  -v /local/host/folder/filewaveserver/config/fwxserver.conf:/usr/local/etc/fwxserver.conf \
  -v /local/host/folder/filewaveserver/config/apache/conf:/usr/local/filewave/apache/conf \
  -v /local/host/folder/filewaveserver/config/apache/passwd:/usr/local/filewave/apache/passwd \
  -v /local/host/folder/filewaveserver/ipa:/usr/local/filewave/ipa \
  -v /local/host/folder/filewaveserver/media:/usr/local/filewave/media \
  -v /local/host/folder/filewaveserver/backup:/backup \
  -e FWSERVER_BACKUP=1 \
  nielshojen/filewaveserver
```

# Specific Versions

You can use the version tag to run a specific version of the server if needed (eg. 12.8.0):

```bash
$ docker pull nielshojen/filewaveserver:12.8.0
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  --net=host \
  -v /local/host/folder/data:/fwxserver \
  -v /local/host/folder/config:/usr/local/filewave \
  -v /local/host/folder/backup:/backup \
  -e FWSERVER_BACKUP=1 \
  nielshojen/filewaveserver:12.8.0
```
