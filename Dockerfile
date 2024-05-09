# Base image.
FROM steamcmd/steamcmd:ubuntu-22

# Update everything and install dependencies.
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y dumb-init xvfb wine \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install game's dedicated server.
# Forced installation directory must be absolute.
RUN steamcmd +@sSteamCmdForcePlatformType windows +force_install_dir /mnt/VRisingDedicatedServer +login anonymous +app_update 1829350 +quit

# Change working directory.
WORKDIR /mnt/VRisingDedicatedServer

# Mountpoint for saved data.
VOLUME ["/mnt/AppData"]

# Expose required server port.
EXPOSE 9876/udp

# Expose port for Steam features.
EXPOSE 9877/udp

# Install entrypoint script.
COPY entrypoint.sh /

# Set entrypoint.
# We use dumb-init to correctly handle signals.
ENTRYPOINT ["/usr/bin/dumb-init", "--", "/entrypoint.sh"]
