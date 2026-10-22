#!/bin/bash

# Define source directory and where to save the backup
SOURCE_DIR="/home/ubuntu/bashscripts"
BACKUP_DIR="/home/ubuntu/backup"

# Generate a timestamp (Format: YYYY-MM-DD_HHMMSS)
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")
BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# Check if the source directory actually exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist."
    exit 1
fi

# Create the backup destination folder if it doesn't exist
#mkdir -p "$BACKUP_DIR"

# Create the compressed tar archive
echo "Starting backup of $SOURCE_DIR..."
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup completed successfully!"
    echo "Saved to: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Error: Backup creation failed."
    exit 1
fi
