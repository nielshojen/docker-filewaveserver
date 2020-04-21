# FileWave Server Docker Image

## UPDATE: FileWave got their knickers in a bunch and told me to remove the image from docker hub. So fork off this repo, Change the Dockerfile as you see fit and roll your own image 

This Docker image runs a FileWave Server

# Settings

Several options are customizable using environment variables.

* ``FWSERVER_BACKUP``: If the FileWave provided backup script should run daily. Defaults to ``0``.

Default exposed ports are: ``20005``, ``20006``, ``20015``, ``20016``, ``20017``, ``20030``, ``20443``, ``20445``, ``20446``


# Running the FileWave Server Container

```bash
$ docker pull nielshojen/filewaveserver
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  -p 20005:20005 \
  -p 20006:20006 \
  -p 20015:20015 \
  -p 20016:20016 \
  -p 20017:20017 \
  -p 20030:20030 \
  -p 20443:20443 \
  -p 20445:20445 \
  -p 20446:20446 \
  nielshojen/filewaveserver
```

# Persisting the Server Data

The server data lives in /fwxserver, config file lives in /usr/local/etc, different important files live in /usr/local/filewave and backup lives in /backup (if enabled) so mounting those to directories/files on the host would be a good idea and requires extra lines:
```bash
$ docker pull nielshojen/filewaveserver
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  -p 20005:20005 \
  -p 20006:20006 \
  -p 20015:20015 \
  -p 20016:20016 \
  -p 20017:20017 \
  -p 20030:20030 \
  -p 20443:20443 \
  -p 20445:20445 \
  -p 20446:20446 \
  -v /local/host/folder/filewaveserver/data:/usr/local/filewave/fwxserver \
  -v /local/host/folder/filewaveserver/config/fwxserver.conf:/usr/local/etc/fwxserver.conf \
  -v /local/host/folder/filewaveserver/config/apache/conf:/usr/local/filewave/apache/conf \
  -v /local/host/folder/filewaveserver/config/apache/passwd:/usr/local/filewave/apache/passwd \
  -v /local/host/folder/filewaveserver/config/certs:/usr/local/filewave/certs \
  -v /local/host/folder/filewaveserver/ipa:/usr/local/filewave/ipa \
  -v /local/host/folder/filewaveserver/media:/usr/local/filewave/media \
  -v /local/host/folder/filewaveserver/backup:/backup \
  -e FWSERVER_BACKUP=1 \
  nielshojen/filewaveserver
```

# Specific Versions

You can use the version tag to run a specific version of the server if needed, which you probably should do anyway (eg. 13.2.3):

```bash
$ docker pull nielshojen/filewaveserver:13.2.3
$ docker run -d --restart always --name=filewaveserver \
  --restart="always" \
  -p 20005:20005 \
  -p 20006:20006 \
  -p 20015:20015 \
  -p 20016:20016 \
  -p 20017:20017 \
  -p 20030:20030 \
  -p 20443:20443 \
  -p 20445:20445 \
  -p 20446:20446 \
  -v /local/host/folder/filewaveserver/data:/fwxserver \
  -v /local/host/folder/filewaveserver/config/fwxserver.conf:/usr/local/etc/fwxserver.conf \
  -v /local/host/folder/filewaveserver/config/apache/conf:/usr/local/filewave/apache/conf \
  -v /local/host/folder/filewaveserver/config/apache/passwd:/usr/local/filewave/apache/passwd \
  -v /local/host/folder/filewaveserver/config/certs:/usr/local/filewave/certs \
  -v /local/host/folder/filewaveserver/ipa:/usr/local/filewave/ipa \
  -v /local/host/folder/filewaveserver/media:/usr/local/filewave/media \
  -v /local/host/folder/filewaveserver/backup:/backup \
  -e FWSERVER_BACKUP=1 \
  nielshojen/filewaveserver:13.2.3
```
