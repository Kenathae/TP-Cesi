package azure

import data.azure.virtual_machines

# Define the policy
policy {
  # Iterate over all virtual machines
  vm in virtual_machines.list {
    # Check if the virtual machine has the "confidential" tag
    vm.tags.confidential == "true"
    # Check if the virtual machine has a security level of at least "high"
    vm.security_level >= "high"
  }
}
