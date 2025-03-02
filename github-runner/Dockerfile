FROM ubuntu:latest

# Provided by create.sh
ARG required URL
ARG required TOKEN
ARG required NAME

# Update to reflect the version of the Runner to setup
ARG VERSION=2.322.0

RUN apt-get update && apt-get -y upgrade && apt-get -y install curl bash dotnet-runtime-8.0 libicu74

RUN mkdir /opt/actions-runner
RUN useradd --create-home --shell /bin/bash github
RUN chown github:github -R /opt/actions-runner
WORKDIR /opt/actions-runner

RUN curl -o actions-runner-linux-x64-$VERSION.tar.gz -L https://github.com/actions/runner/releases/download/v$VERSION/actions-runner-linux-x64-$VERSION.tar.gz
RUN tar xf actions-runner-linux-x64-$VERSION.tar.gz
RUN ./bin/installdependencies.sh

USER github
RUN ./config.sh --url $URL --token $TOKEN --name $NAME
CMD ["./run.sh"]
