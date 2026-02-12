#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backups"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

echo "Work Completed: $BACKUP_FILE"

