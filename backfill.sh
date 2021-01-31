#!/bin/bash
DATADIR=$(mktemp -d -p $(pwd))
PROMCONF="promethesu.yml"
promtool tsdb create-blocks-from openmetrics data.file $DATADIR

# Start prometheus
echo "Starting prometheus..."
touch $PROMCONF
prometheus --storage.tsdb.path ${DATADIR}
echo "Cleaning up..."
rm -rf $PROMCONF $DATADIR
