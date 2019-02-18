FROM ubuntu:bionic
RUN apt-get update && apt-get install -y wget git
RUN wget -O /usr/bin/bosh https://github.com/cloudfoundry/bosh-cli/releases/download/v5.4.0/bosh-cli-5.4.0-linux-amd64
RUN chmod +x -R /usr/bin