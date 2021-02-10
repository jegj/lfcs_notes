#!/bin/bash

sudo apt install rsync
mkdir foo bar

# 1) Copy a file locally
rsync ready-for.sh /tmp/

# 2) Sync locally

# -a Archive mode, preserves mtime, permissions and symlinks.
# -r Recursive mode, drills down into any directories and syncs those
# -u Only updates files if the mtime on the source is newer.
# -v Verbose mode
# -z compress
# -P, equivalent to --partial --progress. When this option is used, rsync shows a progress bar during the transfer and keeps the partially transferred files. It is useful when transferring large files over slow or unstable network connections.

echo "this is another test" >> ./foo/testfoo
rsync -aruv ./foo/* ./bar/

# 2) Synchronize folder remote server( defualt ssh)

rsync -avz Atuncar/ jegj@192.168.86.56:remote/

# 3) Synchronize file remote server( defualt ssh)
rsync -avz test jegj@192.168.86.56:

# 4) Change ssh options
rsync -avz README.md -e 'ssh -i /home/jegj/projects/lfcs_training/vagrant/.vagrant/machines/lfcs_sandbox/virtualbox/private_key' vagrant@192.168.86.56:

# 5) Transfer from remote to local
rsync -azv jegj@192.168.86.56:test /tmp

# 6) Custom ssh options
rsync -a -e "ssh -p 2322" /opt/media/ remote_user@remote_host_or_ip:/opt/media/

# 7) Partial(Big files)
rsync -avz  --partial test jegj@192.168.86.56:
rsync -avzP test jegj@192.168.86.56: # partial and progress


#https://explainshell.com/explain?cmd=rsync+-avz+--progress+--partial+-e