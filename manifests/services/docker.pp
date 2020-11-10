# Install docker
class profile::services::docker {

  $dns_servers = split(lookup('profile::dns::nameservers'), ' ')
  $dns_search = lookup('profile::dns::searchdomain')
  $enable_ncr = lookup('profile::ncr::enable', {
    'default_value' => false,
  })

  class { '::docker':
    dns        => $dns_servers,
    dns_search => $dns_search,
  }

  class { '::docker::compose': }

  if ($enable_ncr) {
    class { '::profile::services::docker::ncr':
      require => Class['docker']
    }
  }
}
