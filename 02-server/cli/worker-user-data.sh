#!/bin/bash

function install_ssm_agent() {
  echo "Installing SSM Agent..."
  apt-get update -y
  if [! -d "/tmp/ssm" ]; then
    mkdir -p /tmp/ssm
  fi

  cd /tmp/ssm

  if [ ! -f "amazon-ssm-agent.deb" ]; then
    echo "Downloading the SSM Agent debian package..."
    wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
  fi
  dpkg -i amazon-ssm-agent.deb
  systemctl enable amazon-ssm-agent
  systemctl start amazon-ssm-agent
}  

install_ssm_agent