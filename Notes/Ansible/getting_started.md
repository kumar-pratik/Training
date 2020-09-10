# Requirements and installation
## Prerequisites
You install Ansible on a control node, which then uses SSH (by default) to communicate with your managed nodes (those end devices you want to automate).

## Control node requirements
Currently Ansible can be run from any machine with Python 2 (version 2.7) or Python 3 (versions 3.5 and higher) installed. This includes Red Hat, Debian, CentOS, macOS, any of the BSDs, and so on. Windows is not supported for the control node.

## Managed node requirements
On the managed nodes, you need a way to communicate, which is normally SSH. By default this uses SFTP. If that’s not available, you can switch to SCP in ansible.cfg. You also need Python 2 (version 2.6 or later) or Python 3 (version 3.5 or later).

## Installing Ansible on Ubuntu
```
$ sudo apt update
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install ansible
```
## Working
Ansible works by connecting to your nodes and pushing out small programs, called "Ansible modules" to them. These programs are written to be resource models of the desired state of the system. Ansible then executes these modules (over SSH by default), and removes them when finished.

