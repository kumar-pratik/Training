# What is Ansible?

Ansible is an IT automation tool. It can configure systems, deploy software, and orchestrate more advanced IT tasks such as continuous deployments or zero downtime rolling updates.
Ansible’s main goals are simplicity and ease-of-use. It also has a strong focus on security and reliability, featuring a minimum of moving parts, usage of OpenSSH for transport (with other transports and pull modes as alternatives), and a language that is designed around auditability by humans–even those not familiar with the program.

### How Ansible works
In Ansible, there are two categories of computers: the control node and managed nodes. The control node is a computer that runs Ansible. There must be at least one control node, although a backup control node may also exist. A managed node is any device being managed by the control node.

Ansible works by connecting to nodes (clients, servers, or whatever you're configuring) on a network, and then sending a small program called an Ansible module to that node. Ansible executes these modules over SSH and removes them when finished. The only requirement for this interaction is that your Ansible control node has login access to the managed nodes. SSH keys are the most common way to provide access, but other forms of authentication are also supported.

### What Ansible does
The term Ansible modules sounds complex, but most of the complexity is handled by Ansible and not the user. An Ansible module is written to be a model of the desired state of a system, meaning that each module defines what should be true on any given managed node. For instance, if a systems administrator decides that all workstations in an organization should have LibreOffice version X.Z installed, then it's up to Ansible's packaging module to determine whether each node has LibreOffice X.Z on it. Should Ansible find a managed node with LibreOffice X.Y installed, then it detects the operating system and runs the necessary routine to update it to LibreOffice X.Z. In this way, every workstation in an organization can be updated overnight with the software supported by the IT department.

### Ansible playbooks
While modules provide the means of accomplishing a task, the way you use them is through an Ansible playbook. A playbook is a configuration file written in YAML that provides instructions for what needs to be done in order to bring a managed node into the desired state. Playbooks are meant to be simple, human-readable, and self-documenting. They are also idempotent, meaning that a playbook can be run on a system at any time without having a negative effect upon it. If a playbook is run on a system that's already properly configured and in its desired state, then that system should still be properly configured after a playbook runs.
