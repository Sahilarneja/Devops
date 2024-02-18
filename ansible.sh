# Step 1: Installation
# Update package index to ensure you have the latest package information
sudo apt update

# Install Ansible
sudo apt install ansible

# Check Ansible version to verify the installation
ansible --version

# Step 2: Establish Connection
# Generate SSH key pair on the control node (master server)
ssh-keygen 

# List SSH keys to ensure the keys are generated successfully
ls ~/.ssh/

# Display the public key to copy it to the target servers
cat ~/.ssh/id_rsa.pub

# Copy the public key to the target server
# On the target server, paste the public key into the authorized_keys file in the ~/.ssh/ directory

# Test SSH connection from the control node to the target server using private key
ssh -i <private_key_path_of_target_server> <username>@<target_server_ip>
# Example: ssh -i ~/.ssh/id_rsa ubuntu@13.51.200.49

# Step 3: Configuration from control node to target server
# Create a directory for Ansible configuration
mkdir ansible

# Create an inventory file (hosts) with server IP addresses
vim ansible/hosts
# Add server IP addresses to the inventory file

# Example of inventory file:
# [servers]
# server_1 ansible_host=13.51.200.49
# server_2 ansible_host=16.170.218.178
# server_3 ansible_host=16.171.32.219
# [all:vars]
# ansible_python_interpreter=/usr/bin/python3

# List hosts from the inventory file in YAML format
ansible-inventory --list -y -i /home/ubuntu/ansible/hosts

# Set permissions for SSH directory and files
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Test SSH connectivity to target servers from the control node
ansible-inventory --list -y -i /home/ubuntu/ansible/hosts
# Ensure all servers are connected by trying to SSH into each server

# ==========================================
# PLAYBOOKS
# Create a directory for playbooks
mkdir playbooks
cd playbooks

# Example playbook-1: Create a file
vim create_file.yml

# ---
# - name: This playbook will create a file
#   hosts: all
#   become: true
#   tasks:
#     - name: create a file
#       file:
#         path: /home/ubuntu/sahil.txt
#         state: touch

# This Ansible playbook creates a file named "sahil.txt" in the /home/ubuntu/ directory 
# on all hosts specified in the inventory, ensuring that the file exists with an updated timestamp.

# Execute playbook-1 to create a file
ansible-playbook create_file.yml -i /home/ubuntu/ansible/hosts --private-key=~/.ssh/ansible_key

# Example playbook-2: Create a user
vim create_user.yml

# ---
# - name: This playbook will create a user
#   hosts: all
#   become: true
#   tasks:
#     - name: To create a user named sahilarneja
#       user:
#         name: sahilarneja

# This Ansible playbook creates a user named "sahilarneja" 
# on all hosts specified in the inventory, with elevated privileges enabled.

# Execute playbook-2 to create a user
ansible-playbook create_user.yml -i /home/ubuntu/ansible/hosts --private-key=~/.ssh/ansible_key
