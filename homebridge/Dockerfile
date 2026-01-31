FROM homebridge/homebridge:latest

# In support of SmartThings
ARG SMARTTHINGS_CLI_VERSION="2.0.2"
ARG SMARTTHINGS_TAR="/tmp/smartthings-linux-x64.tgz"

RUN apt-get update

# Install SmartThings support
EXPOSE 61973
RUN apt-get -y install xdg-utils
RUN wget -O ${SMARTTHINGS_TAR} https://github.com/SmartThingsCommunity/smartthings-cli/releases/download/@smartthings/cli@${SMARTTHINGS_CLI_VERSION}/smartthings-linux-x64.tgz
RUN tar xf ${SMARTTHINGS_TAR} -C /usr/bin
