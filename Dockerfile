FROM node:20-slim
RUN apt-get update && \
  apt-get install -y openjdk-17-jdk && \
  npm install -g firebase-tools

COPY firebase.json .
EXPOSE 9099

COPY storage.rules .
EXPOSE 9199
RUN firebase setup:emulators:storage

ENTRYPOINT [ "firebase", "emulators:start", "--only", "auth,storage" ]
