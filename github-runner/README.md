# Github Self-Hosted Runner

This will create and start a Github self-hosted runner, connecting it to the specified repository/organization and allowing for it to be used as appropriate in CI/CD pipelines. From the location to which the runner is to be connected, simply go to Settings --> Actions --> Runners --> New runner --> New self-hosted runner. This will display the prescribed steps and ultimately the necessary configuration options that are needed by the `create.sh` script. 

## Verify the Github Runner Version

First, verify that the latest version of the `Github Runner` is used. Verify that the version listed in the **Download** section matches what the `Dockerfile` is referencing. It should look like the following

```
# Create a folder
$ mkdir actions-runner && cd actions-runner
# Download the latest runner package
$ curl -o actions-runner-linux-x64-<version>.tar.gz -L https://github.com/actions/runner/releases/download/v<version>/actions-runner-linux-x64-<version>.tar.gz
# Optional: Validate the hash
$ echo "<hash>  actions-runner-linux-x64-<version>.tar.gz" | shasum -a 256 -c
# Extract the installer
$ tar xzf ./actions-runner-linux-x64-<version>.tar.gz
```

Compare the version in the section above to the version that is listed in the `VERSION` variable of the `Dockerfile`. Update the `Dockerfile` as necessary.


## Create the Docker Container

Underneath the **Download** section referenced above, is **Configure** which should look like the following

```
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/<location> --token <token>
# Last step, run it!
$ ./run.sh
```

*Note: need to select the Linux architecture to see exactly what is seen above*

To create the runner simply pull the following information from the `./config.sh` line (as seen above):

- `--url <url>` provides the `URL` argument
- `--token <token>` provides the `TOKEN` argument

With this information, run `create.sh`

```
./create.sh <URL> <TOKEN> <NAME>
```

The <NAME> is an "arbitrary" name for what the created Docker image/container should be called, and under what name it is to be registered with Github. For example:

```
./create.sh https://github.com/user/repo ABCABCABCABCABCABCABCABCABCABC my-runner
```

Upon termination of the script the runner will be created, registered, and started, ready for use for Github pipelines!
