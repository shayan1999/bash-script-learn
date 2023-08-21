#!/bin/bash

backup_dir="./backup"
max_backups=5

# Clean up old backups
if [ $(ls -1 "$backup_dir" | wc -l) -gt $max_backups ]; then
    oldest_backup=$(ls -1t "$backup_dir" | tail -1)
    rm -rf "$backup_dir/$oldest_backup"
    echo "Removed old backup: $oldest_backup"
fi

# Create new backup
backup_name="backup_$(date +%Y%m%d%H%M%S)"
mkdir "$backup_dir/$backup_name"
cp -r ./data "$backup_dir/$backup_name"
echo "Created new backup: $backup_name"