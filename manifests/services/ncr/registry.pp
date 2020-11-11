# Setup auth to our internal docker registry
class profile::services::ncr::registry {

  $registry = lookup('profile::ncr::registry::name', Variant[String,Boolean], undef, false)
  $username = lookup('profile::ncr::registry::username', Variant[String,Boolean], undef, false)
  $password = lookup('profile::ncr::registry::password', Variant[String,Boolean], undef, false)

  docker::registry { $registry:
    username => $username,
    password => $password,
  }
}
