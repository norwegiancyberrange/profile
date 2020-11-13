# Creates database for NCR portal
class profile::services::ncr::db::portal {

  $portal_password = lookup('profile::ncr::portal::db::password', String)

  postgresql::server::db { 'portal':
    user     => 'portal',
    password => $portal_password,
    owner    => 'portal',
  }

}
