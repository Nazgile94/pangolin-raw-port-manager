# Pangolin Raw Port Manager

<img width="742" height="653" alt="image" src="https://github.com/user-attachments/assets/a61fcf34-1693-4e7c-829a-491a0a885aed" />

[Deutsch](README.de.md)

Unofficial community helper for managing **Raw TCP/UDP listener ports** in a self-hosted Pangolin + Traefik Docker Compose setup.

> This project is not affiliated with or endorsed by Pangolin/Fossorial.

## Features

- Interactive German/English language selection
- `--lang de` / `--lang en` for CLI usage
- Add or remove TCP, UDP, or both
- Creates/removes Traefik EntryPoints
- Creates/removes Docker/Gerbil port mappings
- Optional inline comments such as `# Minecraft`
- Lists existing ports and comments
- Automatic configuration backups
- Shows a diff before applying changes
- Validates Docker Compose before restart
- Rollback on validation/restart failure
- Warns before removing Traefik EntryPoints with extra settings
- Avoids rewriting unrelated Compose formatting

## Important

This tool manages the **host-side Traefik EntryPoint and Docker/Gerbil port mapping**.

It does **not**:

- create the Raw TCP/UDP resource in the Pangolin dashboard
- manage UFW/nftables/iptables firewall rules
- decide whether a service should be publicly exposed

You still need to configure the matching Raw Resource in Pangolin.

## Compatibility

The default layout is:

```text
/opt/pangolin/
├── docker-compose.yml
└── config/
    └── traefik/
        └── traefik_config.yml
```

The script automatically looks for common Compose file names and detects whether ports are published through `gerbil` (`network_mode: service:gerbil`) or directly through Traefik.

It was originally developed against a Pangolin 1.23.0-style self-hosted setup. Always review the diff before applying changes on other versions/layouts.

## Requirements

- Linux
- Bash
- Python 3
- Docker
- Docker Compose v2
- root/sudo access

No `yq` dependency is required.

## Installation

```bash
Clone the repository:

git clone https://github.com/Nazgile94/pangolin-raw-port-manager.git
cd pangolin-raw-port-manager
sudo ./install.sh

Then start the tool:

sudo pangolin-port
Without Git

You can also use Code → Download ZIP on GitHub.

After extracting the downloaded archive:

cd pangolin-raw-port-manager-main
sudo ./install.sh
```

Then run:

```bash
sudo pangolin-port
```

## Usage

Interactive:

```bash
sudo pangolin-port
```

List ports:

```bash
sudo pangolin-port list
```

English/German CLI:

```bash
sudo pangolin-port --lang en list
sudo pangolin-port --lang de list
```

Add ports:

```bash
sudo pangolin-port add 25565 tcp "Minecraft"
sudo pangolin-port add 2456 udp "Valheim"
sudo pangolin-port add 8999 both "Game Server"
```

Remove:

```bash
sudo pangolin-port remove 8999 both
```

Diagnostics:

```bash
sudo pangolin-port doctor
```

Skip confirmation:

```bash
sudo pangolin-port -y add 25565 tcp "Minecraft"
```

## Backups

Backups are stored under:

```text
/opt/pangolin/.pangolin-port-backups/
```

New backup directories are restricted to root (`0700`).

Note that backups may contain sensitive values already present in your Compose configuration.

## Uninstall

```bash
sudo ./uninstall.sh
```

Configuration backups are intentionally kept.

## Security

Do not post Compose files, `.env` files, API keys, tokens, or license keys in public issues.

See [SECURITY.md](SECURITY.md).

## License

MIT. See [LICENSE](LICENSE).

## AI transparency

This repository is explicitly an **AI-assisted community project**. Large parts of the code, egg, workflows, and documentation were created or revised with OpenAI ChatGPT. The informal term “vibe coding” partly applies; this project prefers **AI-assisted development**, because human requirements, testing, and decisions remain part of the development process.

See [AI-NOTICE.md](AI-NOTICE.md) for the full disclosure.
