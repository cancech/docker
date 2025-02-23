# Plex (Server)

I employ the [Plex Media Server](https://www.plex.tv/) for at-home media streaming purposes, and the Docker configuration here-in reflects my setup/configuration. The presence of `docker-compose.yml` should be self explanatory, though the `update.bash` less so. This is a convenience script which triggers an update and restart of the running Plex Media Server. When used there are a few items to be aware of:

1. The`volumes` in the `docker-compose.yml` are reflective of how my media is configured.
2. The `config` and `transcode` directories are part of the Plex Media Server itself and should be kept (if transience between containers/images is desired)
3. The other volumes `/raid/...` indicate where the media itself is located
4. This requires a `.env` file to be created in the same directory, the `.env` is to provide the required (secret) `PLEX_CLAIM` token.

To create the `.env`, simply create the file in the cloned directory and populate it as such:

```
PLEX_CLAIM_TOKEN=<token>
```

Refer to the [Plex Support](https://support.plex.tv/articles/204059436-finding-an-authentication-token-x-plex-token/) to find your token.
