#!/usr/bin/env bash

# Checks the output of dpkg-query and installs Ansible only if it's not already installed
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	export DEBIAN_FRONTEND=noninteractive
	
    echo "Add PPA for Ansible repository"
    apt-get install -qq software-properties-common &> /dev/null || exit 1
    apt-add-repository ppa:ansible/ansible &> /dev/null || exit 1
    apt-get update -qq

    echo "Install Ansible"
    apt-get install -qq ansible &> /dev/null || exit 1
fi

# Run Ansible playbook locally
PYTHONUNBUFFERED=1 ansible-playbook -i "localhost," -c local /vagrant/ansible/playbook.yml