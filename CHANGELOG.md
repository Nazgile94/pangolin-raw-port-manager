# Changelog

All notable changes to this project are documented here.

## 3.1.0

- Added German and English implementations.
- Added interactive language selection.
- Added `--lang de` and `--lang en` support.
- Added locale-based language selection for non-interactive commands.
- Hardened backup directory permissions (`0700`).
- Added GitHub-ready installation, documentation, issue templates and CI syntax checks.

## 3.0.1

- Fixed an intermittent false error:
  `Service 'gerbil' was not found in Compose.`
- The Compose service list is now collected before checking it, avoiding a `grep -q` + `pipefail` SIGPIPE race.

## 3.0.0

- Added comment support for Docker port mappings.
- Added port listing with existing comments.
- Added automatic backups and rollback.
- Added Docker Compose validation.
- Added interactive and CLI operation.
- Added warnings when removing EntryPoints containing extra Traefik settings.
- Switched Compose modifications to targeted text editing to preserve unrelated formatting.
