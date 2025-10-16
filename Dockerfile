# Stage 1: Use Alpine as base image
FROM alpine:3.20 AS downloader

# Copy your manually downloaded Alpine rootfs
COPY alpine-minirootfs-3.20.3-x86_64.tar.gz alpine-minirootfs.tar.gz

# Extract it inside the container
RUN mkdir -p /rootfs-extract \
    && tar -xzf alpine-minirootfs.tar.gz -C /rootfs-extract

# Stage 2: Build final minimal image
FROM scratch
COPY --from=downloader /rootfs-extract/ /

CMD ["/bin/sh"]

