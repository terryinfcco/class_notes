#!/bin/bash
# Script to build and copy class_notes to dutchdocs.xyz
# Go to the right folder
cd /home/terry/github/class_notes
# Activate the virtual environment
source venv/bin/activate
# build class notes prior to transfer
mkdocs build
# now mount the remote filesystem using sshfs
sshfs u171564166@dutchdocs.xyz:/home/u171564166/public_html/ /home/terry/temp_sshfs -p 65002
# Copy the /site directory to dutchdocs.xyz
rsync -rtvz /home/terry/github/class_notes/site/ /home/terry/temp_sshfs
# See if I can figure out why the umount gets a busy flag
lsof +f -- /home/terry/temp_sshfs
# Finally unmount the sshfs directory
umount /home/terry/temp_sshfs
