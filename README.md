# signal-desktop-docker
Run Signal Desktop client with GUI in a docker container.

## Requirements
- docker and docker compose
- Debian-based Linux, although it has only been tested with Ubuntu 20.04.

## Getting Started
- Clone the repository.
- Edit the *docker-compose.yaml* file and change the last volume entry "REPLACE_ME" to your desired config directory, for instance `${PWD}/config`. **Warning:** the config directory stores sensitive data from the Signal Desktop client and thus your Signal account! Make sure it has the proper permissions assigned and is stored at a save location (The non-docker client stores it at `~/.config/Signal` and has permission set to 700).
- Run `docker compose up` to build the image and run the container.
