# Dockerized Visual Studio Code Environment

Set up a fully functional Visual Studio Code environment inside a Docker container, based on Ubuntu. This setup is perfect for developers looking for an isolated VS Code workspace with essential tools and Docker Engine included.

---

## Features

- **Development Tools Pre-installed**: Equipped with Git, Curl, Wget, SSH, and more for a comprehensive development setup.
- **Docker Engine Integration**: Build Docker containers within this VS Code environment.
- **Visual Studio Code Ready**: Access VS Code through a web browser, offering a seamless development experience.
- **Runs Entirely Locally**: Operates independently without the need for `vscode.dev`.
- **Official VS Code Version**: Uses the `official Visual Studio Code`, providing access to the official extension marketplace for a wide range of extensions.

## Prerequisites

- Docker must be installed on your system.

## Installation

### Building the Docker Image

1. Clone this repository.
2. Navigate to the directory containing the Dockerfile.
3. Execute the following command to build the image:

    ```bash
    docker build -t code-server .
    ```

### Running the Docker Container

#### Using Docker Command

Launch the container with:

    ```bash
    docker run -d -p 8455:8455 code-server
    ```

This command runs the container in detached mode and maps port 8455 from the host to the container.

#### Using Docker Compose

1. Ensure the `docker-compose.yml` file is in the same directory and updated with your values.
2. Start the service using:

    ```bash
    docker-compose up -d
    ```

This command runs the container in detached mode and maps port 8455 from the host to the container.

### Accessing Visual Studio Code

Open a web browser and visit:

    ```
    http://localhost:8455
    ```

to access the VS Code interface.

## Contributing

We encourage contributions to improve and enhance this Dockerized VS Code setup.

## License

This project is released under the MIT License - for more information, refer to the [LICENSE](LICENSE) file.

---