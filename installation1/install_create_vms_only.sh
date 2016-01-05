#!/bin/sh

# We use the directory where this file is located in.
# This way we can use the local paths.
cd `dirname $0`

tools/start_stepping

tools/step ./install_tools.sh
tools/step ./install_ansible.sh
tools/step ./create_ssh_keys.sh
tools/step ./install_lib_virt.sh
tools/step ./create_virtual_networks.sh
tools/step ./create_virtual_machine_image.sh
tools/step ./create_virtual_machines.sh
tools/step ./configure_ansible_for_vms.sh
tools/step ./wait_for_virtual_machines_to_start.sh