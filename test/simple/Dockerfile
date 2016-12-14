# Pull base image.
FROM quay.io/eris/base
MAINTAINER Eris Industries <support@erisindustries.com>

#-----------------------------------------------------------------------------
# dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libgmp3-dev jq && \
  rm -rf /var/lib/apt/lists/*

# get and install go-ethereum (for geth attach commands)
ENV REPO $GOPATH/src/github.com/ethereum/go-ethereum
RUN mkdir -p $REPO
RUN git clone https://github.com/ethereum/go-ethereum $REPO
WORKDIR $REPO
RUN make geth

# install the eth-client for making genesis files
RUN go get github.com/eris-ltd/eth-client/ethgen

# install tendermint
RUN go get github.com/tendermint/tendermint/cmd/tendermint

# install geth-tmsp (uses vendoring experiment)
ENV GO15VENDOREXPERIMENT 1
ENV REPO $GOPATH/src/github.com/eris-ltd/geth-tmsp
COPY . $REPO 
WORKDIR $REPO
RUN chmod +x ./test/test.sh
RUN go get
RUN go install

VOLUME $REPO

CMD "./test/test.sh"
