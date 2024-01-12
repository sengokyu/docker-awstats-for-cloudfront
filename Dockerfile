FROM alpine:latest

RUN apk add --no-cache s3fs-fuse awstats aws-cli

## Create directories
## - /logs: S3FS mount point
## - /awstats/data: awstats data directory
## - /awstats/result: awstats output directory
## Copy awstats icon files
RUN mkdir -p /logs /awstats/data /awstats/result && cp -r /usr/lib/awstats/icon /awstats/result

COPY --chown=root:root rootfs /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/run-awstats.sh" ]

