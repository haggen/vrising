# V Rising dedicated server

> V Rising dedicated server running on Linux containers.

## Usage

1. Clone the repository.
2. Edit configuration files at `./config` accordingly.
3. Run `docker compose up`.

## Recipes

### Ignore configuration changes

Run:

```sh
git update-index --assume-unchanged config
```

Later, to undo:

```sh
git update-index --no-assume-unchanged config
```

### Export saved data

Generate a tarball with the contents of `/mnt/AppData`.

```sh
docker compose cp srv:/mnt/AppData/. - > VRisingDedicatedServer-AppData-$(date +"%s").tar
```

### Import saved data

Extract the tarball into the container.

```sh
docker compose cp - srv:/mnt/AppData < AppData.tar
```

## References

- <https://github.com/StunlockStudios/vrising-dedicated-server-instructions>
- <https://vrising.fandom.com/wiki/V_Rising_Dedicated_Server>
- <https://developer.valvesoftware.com/wiki/SteamCMD>

## Legal

Apache-2.0 © 2022 Arthur Corenzan

This project is not created by, affiliated with or sponsored by Stunlock Studios. V Rising and V Rising related materials are intellectual properties of Stunlock Studios. All rights are reserved worldwide.
