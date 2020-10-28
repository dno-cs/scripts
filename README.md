## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](images/NetworkDiagram.png)

**Note**: The IP address 192.168.0.1 in the diagram above and where mentioned below should be replaced by your personal public IP address.

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - docker_dvwa-playbook.yml
  - install-elk.yml
  - filebeat-playbook.yml
  - metricbeat-playbook.yml
  - ansible.cfg
  - hosts
  - filebeat-config.yml
  - metricbeat-config.yml


This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting DoS attacks to the network.
- Load Balancers protect against DDoS attacks. The advantage of a jump box is that you will have only one, highly protected machine, to carry out all your administartion work on other less secure servers.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the services and system logs.
- Filebeat watches for system log changes.
- Metricbeat records services running on the server.

The configuration details of each machine may be found below.

| Name                 | Function   | Private IP Address | Operating System |
|----------------------|------------|--------------------|------------------|
| Jump-Box-Provisioner | Gateway    | 10.0.0.4           | Linux - Ubuntu   |
| Web-1                | Web Server | 10.0.0.5           | Linux - Ubuntu   |
| Web-2                | Web Server | 10.0.0.6           | Linux - Ubuntu   |
| Web-3                | Web Server | 10.0.0.7           | Linux - Ubuntu   |
| ELK-Server           | ELK Server | 10.1.0.4           | Linux - Ubuntu   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

The Jump Box and ELK Serer machines can accept connections from the Internet. Access to these machines is only allowed from the following IP addresses:
- 192.168.0.1

Machines within the network can only be accessed by the personal home machine.
- The personal home machine can access the ELK VM. IP Address: 192.168.0.1

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses |
|----------------------|---------------------|----------------------|
| Jump-Box-Provisioner | No                  | 192.168.0.1          |
| Web-1                | Yes                 | 20.37.253.53         |
| Web-2                | Yes                 | 20.37.253.53         |
| Web-3                | Yes                 | 20.37.253.53         |
| ELK-Server           | No                  | 192.168.0.1          |


### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Any new VM's can be identically setup as the existing VM's.

The playbook implements the following tasks:
- Increase memory on the VM
- Install Docker
- Install Python
- Install ELK with published ports 5044, 5601, and 9200
- Ensure Docker and ELK restart with the VM

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](Images/docker_ps_output.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- 10.0.0.5
- 10.0.0.6
- 10.0.0.7

We have installed the following Beats on these machines:
- Filebeats
- Metricbeats

These Beats allow us to collect the following information from each machine:
- 

_TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
