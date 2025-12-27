#!/bin/bash

MARKER="/var/lib/network-dns-fix/dns-applied"

if [ -f "$MARKER" ]; then
  echo "DNS script már lefutott korábban. Kilépés."
  exit 0
fi

nmcli -t -f NAME,TYPE,DEVICE connection show --active | grep -E 'ethernet|wireless' | cut -d: -f1 | while IFS= read -r CONN_NAME; do

  echo "DNS beállítás: $CONN_NAME"

  nmcli connection modify "$CONN_NAME" ipv4.dns "127.0.0.1"
  nmcli connection modify "$CONN_NAME" ipv4.dns-options "trust-ad"
  nmcli connection modify "$CONN_NAME" ipv4.ignore-auto-dns "yes"

  nmcli connection modify "$CONN_NAME" ipv6.dns "::1"
  nmcli connection modify "$CONN_NAME" ipv6.dns-options "trust-ad"
  nmcli connection modify "$CONN_NAME" ipv6.ignore-auto-dns "yes"

  nmcli connection down "$CONN_NAME"
  nmcli connection up "$CONN_NAME"
done

mkdir -p "$(dirname "$MARKER")"
touch "$MARKER"
