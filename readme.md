
## This is a test role for server preparation

This role do this tasks:

Task: Prepare the OS using Ansible 
    Using Ansible, implement the ability to perform the following actions (and repeat them on other servers in the future): 
        1. Implement the procedure of encrypting the second disk in the system (where there is no root partition) (partition name should be specified in the inventory). 
        2. Implement a procedure to encrypt the partition that is present on the disk next to the root partition. 
        3. Disabling C-state for all available CPUs. 
       4.  Switching CPU operation from power-saving mode to more productive mode. 
       5.  Rename the active network interface to "net0". Display information about the renamed interface during the playbook 
        At the end of the playbook execution, a list of CPUs should be displayed, as well as information about Intel Hyper-Threading (AMD multithreading). 

Role consist of three task files:
- crypt_disk.yml (tasks 1, 2)
- interface.yml (task 5)
- main.yml (tasks 3, 4)

## How to use
```
git clone this repo
cd ansible-role
ansible-playbook -i inventory playbook.yml
```