#!/bin/bash

cd /home/ubuntu/CI_CD_GithubAction || exit

echo "Stopping old app..."
pkill -f "python3 app.py" || true

echo "Fetching latest code..."
git fetch origin main
git reset --hard origin/main

echo "Installing dependencies..."
pip3 install -r requirement.txt

echo "Starting app..."
nohup python3 app.py > app.log 2>&1 &