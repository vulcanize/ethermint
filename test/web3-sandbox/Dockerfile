# Pull base image.
FROM golang:1.6

# Grab deps (jq, hexdump, xxd, killall)
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  jq bsdmainutils vim-common psmisc 

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    nodejs && \
  rm -rf /var/lib/apt/lists/*

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn

# Copy in the dir
ENV ROOT /test
COPY . $ROOT
WORKDIR $ROOT

# Install js deps
RUN yarn install
