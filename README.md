# AIO_ESXi Project

## Overview

This solution uses Ansible to automate the installation of a BL server on a C7K infrastructure managed by OneView 3.x and uses ICsp to deploy a VMWare ESXi host.

## Requirements
[link to HPE OneView/Ansible!](https://github.com/HewlettPackard/oneview-ansible)

## Setup
To run the ansible modules provided you should execute the following steps:

### 1. Clone the repository

Run:

```bash
$ git clone https://github.com/maxaquino/AIO_ESX
```

### 2. Create the configuration files:

Create a json file named oneview_config.json with the credentials as follow:
```
{
  "ip": "192.168.0.100",
  "credentials": {
    "userName": "Administrator",
    "password": "yourpassword"
  },
  "api_version": 300
}
```

and a file named oneview_config.sh with the same credentials as follow:
```
OVIP=192.168.0.100
OVU=Administrator
OVPW=yourpassword
```

## 3. Run the playbook
To run the playbook, just type the following command on your ansible machine:

```
ansible-playbook -i hosts server_renewal.yml
```


## ToDo

