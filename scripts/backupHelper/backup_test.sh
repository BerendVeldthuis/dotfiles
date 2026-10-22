#!/usr/bin/zsh
#
# Simple restic backup tool by Berend Veldtuis

# configuration
BACKUP_REPOSITORY="/media/qbyte/smb/Backups/laptop"
BACKUP_TARGET=~
BACKUP_EXCLUDE_FILE=exclude.txt

NETWORK_TARGET="eduroam (from geteduroam)"

export RESTIC_CACHE_DIR=/home/qbyte/.cache/deja-dup/restic

# Main code
if nmcli -g GENERAL.STATE connection show $NETWORK_TARGET | grep -qE 'activated'; then

    # Does the restic repo exist?
    if [ ! -d $BACKUP_REPOSITORY ]; then
        echo Fatal: restic repository: \"$BACKUP_REPOSITORY\" does not exist. |
            systemd-cat -t backups -p crit
        exit 1
    fi

    echo starting backup | systemd-cat -t backups -p notice

        notify-send "Backup started" \
            -i /usr/share/icons/Gruvbox-Material-Dark/22x22/actions/backup.svg 

        restic -r $BACKUP_REPOSITORY backup $BACKUP_TARGET \
            --exclude-file=$BACKUP_EXCLUDE_FILE --dry-run \
            --cleanup-cache --cache-dir=\
            --insecure-no-password > >(systemd-cat -t backups -p info) 2>&1

    if [ $? -eq 0 ]; then
        echo backup finished | systemd-cat -t backups -p notice
        notify-send "Backup complete" \
            -i /usr/share/icons/Gruvbox-Material-Dark/22x22/actions/backup.svg 
        exit 0
    else
        echo backup failed | systemd-cat -t backups -p emerg
        notify-send "Failed backup" \
        "restic had an failure, check logs with journalctl -t backups" \
        -u critical
        exit 1
    fi
else
    echo Fatal: not connected to network: $NETWORK_TARGET |
        systemd-cat -t backups -p emerg
    exit 1
fi
