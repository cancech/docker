# Docker Configurations

This repository is an attempt to not lose or re-create the various Docker configurations, and allow for their potential transfer between systems. If this ends up being of benefit to anyone else, then all the better. Each subdirectory represents a different configuration (i.e.: application) which I need or use for various reasons, and which are expected to work in a self-contained manner. Additional details can be found by looking at each one individually. Present are:

| Name | Description |
| ---  | ---         |
|[Github Runner](./github-runner)|Docker configuration for creating a Github Runner, which can be used for the purpose of executing Github Actions in a self-hosted environment.|
|[Homebridge](./homebridge)|Docker container configuration for running a [homebridge](https://homebridge.io/) instance with [SmartThings CLI](https://github.com/SmartThingsCommunity/smartthings-cli) pre-installed|
|[Plex](./plex)|Docker Compose configuration for creating and starting (my) Plex Server. The configuration is reflective of my setup.|
