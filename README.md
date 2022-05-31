# signal-desktop-docker
Run Signal Desktop client with GUI in a docker container.

## Requirements
- Debian-based Linux, although it has only been tested on Ubuntu 20.04.
- docker and docker compose

## Getting Started
1. Clone the repository.
2. Edit the *docker-compose.yaml* file and change the last volume entry "REPLACE_ME" to your desired config directory, for instance `${PWD}/config`. **Warning:** the config directory stores sensitive data from the Signal Desktop client and thus your Signal account! Make sure it has the proper permissions assigned and is stored at a save location (The non-docker client stores it at `~/.config/Signal` and has permission set to 700).
3. Run `docker compose up` to build the image and run the container.
