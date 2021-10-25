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
          name: run your test
          command: yarn test
          no_output_timeout: 1m
```
