---
title: Deployment strategy for Pledger.io
type: docs
weight: 4
---
The deployment repository is used to bundle the user-interface and REST-api into a single deployable artifact.
This repository is built using the following tooling:

- [Gradle](https://gradle.org/),
used as the build tool.
- [Docker](https://www.docker.com/),
used to create the docker images.
- [Electron](https://www.electron.build/),
used to create the desktop application.

## Build process

{{< image src="img/architecture/application-build-process.png" caption="Build process" wrapper="col-10 mx-auto" >}}

1. Pulling the latest version of the `user-interface` and `REST-api`.
2. Building an output archive for the combined REST-api and user-interface.
3. Building a `docker` image for the combined REST-api and user-interface.
4. Building an `electron application` for the combined REST-api and user-interface.
5. Pushing the docker image to the docker registry.
6. Pushing the desktop application to the release repository.
