#!/bin/bash
# Script to try to get class notes going locally

# cd /home/terry/github/class_notes
cd /home/terry/class_notes
source venv/bin/activate
mkdocs serve &
sleep 2
firefox localhost:8000
