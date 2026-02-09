#!/bin/bash
set -euo pipefail

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=${1:-}
DEST_DIR=${2:-}
DAYS=${3:-14}

mkdir -p "$LOGS_FOLDER"

log() {
    echo -e "$(date '+%Y-%m-%d %H:%M:%S') | $1" | tee -a "$LOGS_FILE"
}

USAGE() {
    log "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> [DAYS(default 14)] $N"
    exit 1
}

# Root check
if [ "$USERID" -ne 0 ]; then
    echo -e "$R Please run this script with root access $N"
    exit 1
fi

# Argument check
[ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ] && USAGE

# Directory checks
[ ! -d "$SOURCE_DIR" ] && log "$R Source dir not found $N" && exit 1
[ ! -d "$DEST_DIR" ] && log "$R Destination dir not found $N" && exit 1

log "Backup started"
log "Source: $SOURCE_DIR"
log "Destination: $DEST_DIR"
log "Days: $DAYS"

TIMESTAMP=$(date +%F-%H-%M-%S)
ARCHIVE="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"

FILES_FOUND=$(find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS")

if [ -z "$FILES_FOUND" ]; then
    log "$Y No files to archive. Skipping $N"
    exit 0
fi

log "Files found for archive"

# Create archive safely
find "$SOURCE_DIR" -type f -name "*.log" -mtime +"$DAYS" -print0 \
| tar --null -czvf "$ARCHIVE" --files-from=-

if [ -f "$ARCHIVE" ]; then
    log "$G Archival SUCCESS $N"

    while IFS= read -r file; do
        log "Deleting $file"
        rm -f "$file"
    done <<< "$FILES_FOUND"
else
    log "$R Archival FAILED $N"
    exit 1
fi