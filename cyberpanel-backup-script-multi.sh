#!/bin/bash
## Author: Michael Ramsey
## Objective: Daily rsync of Cyberpanel full backup files for all domains to a remote server
## How to use.
# chmod +x cyberpanel-backup-script-multi.sh
# ./cyberpanel-backup-script-multi.sh
# bash cyberpanel-backup-script-multi.sh
# Can be setup via cron
#0 0 * * * /root/cyberpanel-backup-script-multi.sh >/dev/null 2>&1


#Rsync Backup script for Cyberpanel accounts to a remote host and custom path. After copied to remote host local source backup files are deleted from the Cyberpanel server.


# SSH username
Username=root

# hostname or IP
Host=some.host.com

#Remote path to move backups to.
RemotePath=/mnt/host12-cyberpanel-backups


rsync --remove-source-files --exclude 'status' -azP /home/*/backup/ $Username@$Host:$RemotePath