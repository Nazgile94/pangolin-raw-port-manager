# Security Policy

## Reporting a security issue

Please do not publish secrets or sensitive configuration in a public issue.

When reporting a problem, remove or redact:

- API keys
- license keys
- passwords
- tokens
- private domains/IPs when sensitive
- `.env` contents
- Docker Compose secrets

## Backups

The tool creates configuration backups under:

```text
/opt/pangolin/.pangolin-port-backups/
```

These backups can contain sensitive data already present in the original Compose/Traefik configuration.

Version 3.1.0 creates new backup directories with root-only permissions (`0700`).

For older backups you may want to restrict permissions manually:

```bash
sudo chmod -R go-rwx /opt/pangolin/.pangolin-port-backups
```
