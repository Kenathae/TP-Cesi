package azure

import data.azure.virtual_machines
import data.azure.network_security_groups
import data.azure.storage_accounts

# Define the policy
policy {
  # Iterate over all virtual machines
  vm in virtual_machines.list {
    # Check if the virtual machine has the "confidential" tag
    vm.tags.confidential == "true"
    # Check if the virtual machine has a security level of at least "high"
    vm.security_level >= "high"
    # Check if the virtual machine is using a network security group that allows traffic only from specific IPs
    vm.network_security_group.allow_traffic_from == ["1.2.3.4/32", "5.6.7.8/32"]
  }

  # Iterate over all network security groups
  nsg in network_security_groups.list {
    # Check if the network security group has a default deny rule
    nsg.default_rule == "deny"
  }

  # Iterate over all storage accounts
  sa in storage_accounts.list {
    # Check if the storage account has encryption enabled
    sa.encryption.enabled == true
    # Check if the storage account has versioning enabled
    sa.versioning.enabled == true
  }
}
