FROM node:16-slim
RUN apt-get update && \
  apt-get install -y openjdk-11-jdk && \
  npm install -g firebase-tools
COPY firebase.json .
EXPOSE 9099
ENTRYPOINT [ "firebase", "emulators:start", "--only", "auth" ]
