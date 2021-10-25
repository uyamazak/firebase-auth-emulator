# firebase-auth-emulator
Only auth server of Firebase Local Emulator Suite for CI testing.


# How to Use (CircleCI)

.circleci/config.ym
```
version: 2.1

jobs:
  test-server:
    docker:
      - image: ghcr.io/uyamazak/firebase-auth-emulator:latest
        command: --project your-firebase-project-name

    steps:
      - checkout
      - run:
          name: Install dockerize #(Optional)
          command: wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && sudo tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
          environment:
            DOCKERIZE_VERSION: v0.3.0
      - run:
          name: Waiting firebase emulator #(Optional)
          command: dockerize -wait tcp://localhost:9099 -timeout 1m
      - run:
          name: Run your test
          command: yarn test
          no_output_timeout: 1m
```
