# Homebridge
In a nutshell, [Homebridge](https://homebridge.io/) is an [Apple Home](https://www.apple.com/home-app/) hub, which can be used to bridge other, non [Apple Home](https://www.apple.com/home-app/) compatible, devices so that they can be used in [Apple Home](https://www.apple.com/home-app/). Best description could be that of a "translator" allowing [Apple Home](https://www.apple.com/home-app/) to talk to things that it wouldn't otherwise understand.

## Setup
The container setup is taken more or less straight from the [Homebridge documentation](https://github.com/homebridge/homebridge/wiki/Install-Homebridge-on-Docker#step-2-create-docker-compose-manifest) with tweaks made for my specific needs. The biggest difference would be the inclusion of additional elements which are desirable in my situation.

### Creating the Container
Standard `docker-compose` processes are employed, ergo to start the container simply run

```
docker-compose up -d
```

from inside the directory. Once the container is started you will be able to access the [Homebridge](https://homebridge.io/) at `http://<docker-host>:8581/`, replacing the appropriate IP address or hostname for the `<docker-host>` placeholder (i.e.: http://127.0.0.1:8581 if running locally). The first time accessing the running [Homebridge](https://homebridge.io/) instance will trigger the creation of an admin account through which to administer the instance.

To connect to [Apple Home](https://www.apple.com/home-app/), simple go through the steps to add a device in the [Apple Home App](https://apps.apple.com/us/app/home/id1110145103) and scan the QR code that is shown in your Homebridge instance.

### Stopping the Container
Standard `docker-compose` processes are employed, ergo to stop the container simply run

```
docker-compose down
```

from inside the directory.

### Extra Additions
For my needs additional items are incorporated and their specifics are included below.

#### SmartThings
The [SmartThings CLI](https://github.com/SmartThingsCommunity/smartthings-cli) is installed, to allow [Homebridge](https://homebridge.io/) to talk to SmartThings devices. After the container is created, additional steps must be manually performed to ensure that the SmartThings connection can be established.

|Step|Action|Additional Information|
|--- |---   | ---                  |
|1|Create the docker container and make sure that it is running| Run `docker-compose up -d` and verify that it is created and started|
|2|Access the running docker container|This can be done by running `docker exec -it <container-name> /bin/bash`, for example `docker exec -it homebridge_homebridge_1 /bin/bash`|
|3|Once in the container need to create the SmartThings instance| Run the command `smartthings apps:create`|
|4|Answer the questions posed|Answer the questions per https://github.com/aziz66/homebridge-smartthings#readme|
|5|Log into your SmartThings account to enable the connection|The last step will attempt to use `xdg-open` to open a browser window automatically and prompt you to log into your SmartThings account. This will not work in a docker container and a `Loading` message will remain on screen with a spinning "waiting" indication. At this point you will have to manually access that page by going to `http://<docker-host>:61973/start` to complete the login (i.e.: http://127.0.0.1:61973/start)|
|6|Acces the "complete" page|Once login has been successful and the steps on the SmartThings site completed, it will attempt to return you to the local instance. If not successful manually change the URL to match your  `docker host`.|
|7|SmartThings registration is now complete, and save the OAuth `Client ID` and `Secret` it spits out|The OAuth information will become necessary later to connect [Homebridge](https://homebridge.io/) to SmartThings.|
|8|Install the desired plugin in your Homebridge instance|From my limited testing/experimentation I opted to go with [homebridge-smartthings-oauth](https://www.npmjs.com/package/homebridge-smartthings-oauth)|
|9|Perform the steps necessary to connect the plugin|Refer to plugin information for how to complete the connection.|

Once the above steps are complete, then any devices present in SmartThings should become available in [Apple Home](https://www.apple.com/home-app/).

**_Limitations:_** it appears that [Apple Home](https://www.apple.com/home-app/) does not provide any support for various appliances such as ranges, ovens, microwaces, dishwashers, washers, or dryers. These may appear as completely random/arbitrary devices in [Apple Home](https://www.apple.com/home-app/) and will more likely not work. For example my Range appears as two separate temperature sensors (with a temperature reading of some 76C) and my Microwave as a switch (either light or fan) which does not work.

