# Localport Homebrew Tap

Homebrew formulae for [Localport](https://localport.io) - secure tunnels that expose any local service to the internet with no port forwarding or public IP.

## Install

```sh
brew install localport/tap/localport
```

Or tap first, then install:

```sh
brew tap localport/tap
brew install localport
```

Upgrade to the latest release:

```sh
brew upgrade localport
```

## What's here

| Formula     | Description                                 |
| ----------- | ------------------------------------------- |
| `localport` | The Localport CLI agent (single Go binary). |

The formula installs a prebuilt binary from the [agent releases](https://github.com/localport/agent/releases) and verifies its checksum.

## Links

- Website: https://localport.io
- Documentation: https://localport.io/docs
- Agent source (Apache 2.0): https://github.com/localport/agent
