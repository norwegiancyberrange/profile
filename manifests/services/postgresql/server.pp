# Install a PostgreSQL server
class profile::services::postgresql::server {

  $password = lookup('profile::postgres::password')

  $ipv4 = $facts['networking']['ip']
  $ipv6 = $facts['networking']['ip6']
  $subnet = $facts['networking']['network']
  $netmask = $facts['networking']['netmask']
  $prefix = ip_prefixlength("${ipv4}/${netmask}")
  $cidr = "${subnet}/${prefix}"
  $ips = concat([$ipv4], $ipv6, '127.0.0.1', '::1')

  $enable_ncr = lookup('profile::ncr::enable', {
    'default_value' => false,
  })


  class { '::postgresql::globals':
    manage_package_repo => true,
    version             => '13',
  }

  class { '::postgresql::server':
    postgres_password       => $password,
    listen_addresses        => join($ips, ','),
    ip_mask_allow_all_users => $cidr,
  }

  if($enable_ncr) {
    include ::profile::services::postgresql::ncr
  }
}
