# Creates database for NCR portal
class profile::services::ncr::db::portal {

  $portal_password = lookup('profile::ncr::portal::db::password', String)
  $portal_server   = lookup('profile::ncr::portal::ip')

  postgresql::server::db { 'portal':
    user     => 'portal',
    password => $portal_password,
    owner    => 'portal',
  }

  postgresql::server::pg_hba_rule { 'allow portal access':
    description => 'Allow the portal server to connect',
    type        => 'host',
    database    => 'portal',
    user        => 'portal',
    address     => "${portal_server}/32",
    auth_method => 'md5',
  }
}
