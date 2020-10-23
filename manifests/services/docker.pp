# Install docker
class profile::services::docker {

  $dns_servers = split(lookup('profile::dns::nameservers'), ' ')
  $dns_search = lookup('profile::dns::searchdomain')

  class { '::docker':
    dns        => $dns_servers,
    dns_search => $dns_search,
  }

  class { '::docker::compose': }
}
