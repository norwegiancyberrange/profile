# Basic networking for all nodes
# We don't need much, as everything is served by DHCP agents
# in Openstack

class profile::baseconfig::networking {

  $nic = $facts['networking']['primary']
  $searchdomain = lookup('profile::networking::searchdomain')

  class { '::netplan':
    ethernets     => {
      $nic => {
        'dhcp4'       => true,
        'nameservers' => {
          'search' => [ $searchdomain ],
        },
      },
    },
    netplan_apply => true,
  }
}
