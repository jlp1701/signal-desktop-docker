# syntax=docker/dockerfile:1
FROM ubuntu:20.04

RUN apt update
RUN DEBIAN_FRONTEND=noninteractive apt install -y sudo wget gpg

RUN export uid=1000 gid=1000 && \
mkdir -p /home/siguser && \
echo "siguser:x:${uid}:${gid}:siguser,,,:/home/siguser:/bin/bash" >> /etc/passwd && \
echo "siguser:x:${uid}:" >> /etc/group && \
echo "siguser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/siguser && \
chmod 0440 /etc/sudoers.d/siguser && \
chown ${uid}:${gid} -R /home/siguser

# 1. Install our official public software signing key
RUN wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
RUN cat signal-desktop-keyring.gpg | tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories
RUN echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | tee -a /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install signal
RUN apt update 
RUN DEBIAN_FRONTEND=noninteractive apt install -y signal-desktop

USER siguser
RUN mkdir -p /home/siguser/.config/Signal

CMD signal-desktop