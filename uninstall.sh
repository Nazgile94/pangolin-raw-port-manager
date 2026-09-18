#!/usr/bin/env bash
set -Eeuo pipefail

if [[ ${EUID} -ne 0 ]]; then
    echo "Please run with sudo/root. / Bitte mit sudo/root ausführen." >&2
    exit 1
fi

rm -f /usr/local/sbin/pangolin-port
rm -f /opt/pangolin/scripts/pangolin-port
rm -f /opt/pangolin/scripts/lib/pangolin-port-en
rm -f /opt/pangolin/scripts/lib/pangolin-port-de

rmdir /opt/pangolin/scripts/lib 2>/dev/null || true

echo "Pangolin Raw Port Manager removed / entfernt."
echo "Backups were NOT deleted / Backups wurden NICHT gelöscht."
