# Multiprobe

> **The Swiss Army Knife for HTTP Testing in Cloud-Native Environments**

Multiprobe is a lightweight HTTP monitoring and testing utility built in Go. It is designed for developers and DevOps teams who need to quickly deploy, test, and monitor HTTP services in containerized environments.

## Features

- **Lightweight & Fast**: Built with Go, minimal footprint.
- **Request Echoing**: Inspect headers, body, and query parameters.
- **Load Testing**: Built-in CPU load generation for stress testing.
- **Observability**: Integrated Prometheus metrics.
- **Cloud-Native**: Ready for Kubernetes and Docker.

## Quick Start

### Running with Docker

```bash
docker run -p 8585:8585 ghcr.io/example/multiprobe:latest
```

### Running Locally

```bash
go run .
```

The server will start on port `8585`.

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/echo` | Echoes back the request details (headers, body, params). Supports `?delay=duration`. |
| GET | `/metrics` | Prometheus metrics. |
| GET | `/primetime` | CPU intensive task (calculates primes). |
| GET | `/hostname` | Returns the server hostname. |
| GET | `/tag` | Returns the version tag. |

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
