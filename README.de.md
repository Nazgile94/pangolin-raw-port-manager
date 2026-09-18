# Pangolin Raw Port Manager

[English](README.md)

Inoffizielles Community-Tool zum Verwalten von **Raw TCP/UDP Listener-Ports** in einem selbst gehosteten Pangolin + Traefik Docker-Compose-Setup.

> Dieses Projekt ist nicht mit Pangolin/Fossorial verbunden und wird nicht offiziell von ihnen unterstützt.

## Funktionen

- Interaktive Sprachwahl Deutsch/Englisch
- `--lang de` / `--lang en` für CLI-Aufrufe
- TCP, UDP oder beide Protokolle hinzufügen/entfernen
- Traefik EntryPoints verwalten
- Docker/Gerbil Port-Mappings verwalten
- Optionale Kommentare wie `# Minecraft`
- Bestehende Ports inklusive Kommentare anzeigen
- Automatische Backups vor Änderungen
- Diff vor dem Anwenden
- Docker-Compose-Validierung
- Rollback bei Fehlern
- Warnung bei EntryPoints mit zusätzlichen Traefik-Einstellungen
- Unbeteiligte Compose-Formatierung wird nicht neu geschrieben

## Wichtig

Das Tool verwaltet den **Traefik EntryPoint und das Docker/Gerbil Port-Mapping auf dem Pangolin-Host**.

Es verwaltet **nicht**:

- die Raw TCP/UDP Resource in der Pangolin-GUI
- UFW/nftables/iptables Firewall-Regeln
- die Entscheidung, ob ein Dienst öffentlich erreichbar sein sollte

Die passende Raw Resource muss weiterhin in Pangolin konfiguriert werden.

## Kompatibilität

Standardmäßig wird folgende Struktur erwartet:

```text
/opt/pangolin/
├── docker-compose.yml
└── config/
    └── traefik/
        └── traefik_config.yml
```

Gängige Compose-Dateinamen werden automatisch erkannt. Das Script erkennt außerdem, ob Ports über `gerbil` (`network_mode: service:gerbil`) oder direkt über Traefik veröffentlicht werden.

Das Tool wurde ursprünglich für ein selbst gehostetes Setup im Stil von Pangolin 1.23.0 entwickelt. Bei anderen Versionen/Layouts sollte der angezeigte Diff vor dem Anwenden geprüft werden.

## Voraussetzungen

- Linux
- Bash
- Python 3
- Docker
- Docker Compose v2
- root/sudo

`yq` wird nicht benötigt.

## Installation

```bash

Clone die repository:

git clone https://github.com/Nazgile94/pangolin-raw-port-manager.git
cd pangolin-raw-port-manager
sudo ./install.sh

Dann starte das Programm:

sudo pangolin-port
Without Git

Du kannst auch denCode als Zip Downloaden → Download ZIP on GitHub.

Nach dem Entpacken:

cd pangolin-raw-port-manager-main
sudo ./install.sh
```

Danach:

```bash
sudo pangolin-port
```

## Verwendung

Interaktiv:

```bash
sudo pangolin-port
```

Ports anzeigen:

```bash
sudo pangolin-port list
```

Sprache festlegen:

```bash
sudo pangolin-port --lang de list
sudo pangolin-port --lang en list
```

Ports hinzufügen:

```bash
sudo pangolin-port add 25565 tcp "Minecraft"
sudo pangolin-port add 2456 udp "Valheim"
sudo pangolin-port add 8999 both "Game Server"
```

Entfernen:

```bash
sudo pangolin-port remove 8999 both
```

Diagnose:

```bash
sudo pangolin-port doctor
```

Ohne Bestätigungsabfrage:

```bash
sudo pangolin-port -y add 25565 tcp "Minecraft"
```

## Backups

Backups liegen unter:

```text
/opt/pangolin/.pangolin-port-backups/
```

Neue Backup-Verzeichnisse erhalten restriktive Root-Rechte (`0700`).

Achtung: Backups können sensible Werte enthalten, die bereits in der Compose-Konfiguration vorhanden sind.

## Deinstallation

```bash
sudo ./uninstall.sh
```

Konfigurations-Backups werden absichtlich nicht gelöscht.

## Sicherheit

Keine Compose-Dateien, `.env`-Dateien, API-Keys, Tokens oder License-Keys in öffentliche Issues posten.

Siehe [SECURITY.md](SECURITY.md).

## Lizenz

MIT. Siehe [LICENSE](LICENSE).
