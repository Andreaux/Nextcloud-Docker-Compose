ARG NEXTCLOUD_VERSION
FROM nextcloud:${NEXTCLOUD_VERSION}

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*
