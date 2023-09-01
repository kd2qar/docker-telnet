#FROM debian:bullseye-slim
FROM debian:bookworm-slim

MAINTAINER kd2qar@gmail.com

ENV  TZ=America/New_York

RUN apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install telnet \
    #vim host net-tools \
    ; \
    apt-get -y autoremove; \
    apt-get -y autoclean; \
    rm -rf /var/lib/apt/lists/*; \
    rm /var/log/dpkg.log;

CMD ["telnet"]
