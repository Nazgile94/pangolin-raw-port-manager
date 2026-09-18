#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

if [[ ${EUID} -ne 0 ]]; then
    echo "Please run with sudo/root. / Bitte mit sudo/root ausführen." >&2
    exit 1
fi

SRC_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="/opt/pangolin/scripts"
LIB_DIR="$TARGET_DIR/lib"
BACKUP_DIR="$TARGET_DIR/install-backups"

mkdir -p "$TARGET_DIR" "$LIB_DIR" "$BACKUP_DIR"
chmod 700 "$BACKUP_DIR"

if [[ -f "$TARGET_DIR/pangolin-port" ]]; then
    cp -a "$TARGET_DIR/pangolin-port" \
        "$BACKUP_DIR/pangolin-port-$(date +%Y%m%d-%H%M%S)"
fi

install -o root -g root -m 0750 "$SRC_DIR/pangolin-port" "$TARGET_DIR/pangolin-port"
install -o root -g root -m 0750 "$SRC_DIR/lib/pangolin-port-en" "$LIB_DIR/pangolin-port-en"
install -o root -g root -m 0750 "$SRC_DIR/lib/pangolin-port-de" "$LIB_DIR/pangolin-port-de"

ln -sfn "$TARGET_DIR/pangolin-port" /usr/local/sbin/pangolin-port

bash -n "$TARGET_DIR/pangolin-port"
bash -n "$LIB_DIR/pangolin-port-en"
bash -n "$LIB_DIR/pangolin-port-de"

echo "Installed / Installiert:"
echo "  /usr/local/sbin/pangolin-port -> $TARGET_DIR/pangolin-port"
echo
echo "Start:"
echo "  sudo pangolin-port"
