#!/usr/bin/env bash

# Error on undefined. Halt on error.
set -ue

# If arguments begin with a dash, we're passing arguments to the server, otherwise we're running a command.
case "${1-}" in
	-*|"")
		;;
	*)
		exec "$@"; exit 0 ;;
esac

# Must use the game client's application ID to run the server.
# https://github.com/StunlockStudios/vrising-dedicated-server-instructions/blob/320f73f2ccda3c21ba424b156ae3fa8d54094eba/1.0.x/INSTRUCTIONS.md
export SteamAppId="1829350"

# Start the server.
# We us xvfb to initialize a virtual display and wine to execute the Windows binary.
xvfb-run wine ./VRisingServer.exe "$@"
