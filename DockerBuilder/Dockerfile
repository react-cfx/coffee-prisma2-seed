FROM mooxe/node

MAINTAINER FooTearth "footearth@gmail.com"

WORKDIR /root

# update
RUN apt-fast update && \
    apt-fast upgrade -y

RUN apt-fast install -y sqlite

RUN fish -lc "yarn global add prisma2@2.0.0-alpha.62"

RUN \
    apt-fast autoremove -y && \
    apt-fast autoclean && \
    rm -rf /var/lib/apt/lists/*
