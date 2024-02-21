#!/bin/bash

# Install python3-pip
sudo apt install -y python3-pip

# Install python packages
sudo python3 setup.py install

# Configure python
sudo python3 setup.py configure

# Navigate to miniprobe directory
cd miniprobe || exit

# Change permissions and move files
sudo chmod +x run_service.sh
sudo mv prtg.service /etc/systemd/system/prtg.service
sudo chmod 777 logs/

# Reload systemd
sudo systemctl daemon-reload
 
# Start the service
sudo systemctl start prtg

# Check service status
sudo systemctl status prtg

# Enable the service to start on boot
sudo systemctl enable prtg
