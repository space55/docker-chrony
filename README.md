# Chrony Docker Image

This is a docker image for running chronyd. It is built on Alpine, exposes port 123, and requires privileged=true to run.

# Run the image

```bash
docker run -it --privileged -v chrony.conf:/etc/chrony.conf:ro space55/chronyd
```

Note that you will need a chrony.conf file to be mounted into the container.
