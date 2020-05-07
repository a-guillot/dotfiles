#!/bin/sh

#Bail if borg is already running, maybe previous run didn't finish
if pidof -x borg >/dev/null; then
    echo "Backup already running"
    exit
fi

# Setting this, so you won't be asked for your repository passphrase:
export BORG_PASSPHRASE='backupLenovoUbuntuAndreas'
# or this to ask an external program to supply the passphrase:
export BORG_PASSCOMMAND='pass show backup'

# Backup all of /home and /var/www except a few
# excluded directories
borg create -v --stats                          \
    '/home/andreas/Seafile/My Library/::{hostname}-{now:%Y-%m-%d}'    \
    /home/andreas/				\
    --exclude '/home/*/.gvfs' \
    --exclude '/home/*/.mozilla/firefox/*/Cache' \
    --exclude '/home/*/.cache/chromium' \
    --exclude '/home/*/.thumbnails' \
    --exclude '/home/*/.local/share/Trash' \
    --exclude '/home/andreas/Seafile' \
    >> $HOME/Seafile/backup.log 2>&1 \

# Use the `prune` subcommand to maintain 7 daily, 4 weekly and 6 monthly
# archives of THIS machine. The '{hostname}-' prefix is very important to
# limit prune's operation to this machine's archives and not apply to
# other machine's archives also.
borg prune -v --list '/home/andreas/Seafile/My Library/' --prefix '{hostname}-' \
   --keep-daily=7 --keep-weekly=4 --keep-monthly=6 \
    >> $HOME/Seafile/backup.log 2>&1 \
