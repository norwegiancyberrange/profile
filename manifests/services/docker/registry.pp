# Setup auth to our internal docker registry
class profile::services::docker::registry {

  $registry = lookup('profile::docker::registry::name', Variant[String,Boolean], undef, false)
  $username = lookup('profile::docker::registry::username', Variant[String,Boolean], undef, false)
  $password = lookup('profile::docker::registry::password', Variant[String,Boolean], undef, false)

  docker::registry { $registry:
    username => $username,
    password => $password,
  }
}
