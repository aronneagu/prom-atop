#!/bin/bash
VMBIN="$(which vm)"
VMIMPORT="http://localhost:8428/api/v1/import/prometheus"

# Start prometheus
echo "Starting VictoriaMetrics..."
$VMBIN &
http POST $VMIMPORT < data.file
read -p "Imported samples in VictoriaMetrics. Press any key to kill VM"
echo "Cleaning up..."
pkill vm
