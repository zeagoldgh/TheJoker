#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
export AWS_DEFAULT_REGION=us-west-2
cd /home/ec2-user
aws s3 cp s3://joke-src-bucket-dzaa1417/api-server.zip api-server.zip
unzip api-server.zip
pip3 install -r requirements.txt
cd src
python3 main.py