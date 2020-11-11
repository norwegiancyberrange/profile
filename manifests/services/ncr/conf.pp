# Define the NCR containers
class profile::services::ncr::conf {

  $registry = lookup('profile::ncr::registry::name')
  $dispatcher_version = lookup('profile::ncr::dispatcher::version', {
    'default_value' => 1,
  })

  $rabbithost = lookup('profile::rabbitmq::host')
  $rabbituser = lookup('profile::rabbitmq::user', {
    'default_value' => 'rabbit',
  })
  $rabbitpassword = lookup('profile::rabbitmq::password')

  file { '/opt/ncr':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0644',
  }
  -> file { '/opt/ncr/conf':
    ensure => directory,
    owner  => root,
    group  => root,
    mode   => '0644',
  }
  -> file { '/opt/ncr/docker-compose.yaml':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('profile/docker-compose/docker-compose.epp', {
      'registry'           => $registry,
      'dispatcher_version' => $dispatcher_version,
    }),
  }

  file { '/opt/ncr/prod.env':
    ensure  => file,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('profile/docker-compose/prod.env.epp', {
      'rabbit_host'     => $rabbithost,
      'rabbit_user'     => $rabbituser,
      'rabbit_password' => $rabbitpassword,
    }),
  }

  file { '/opt/ncr/ctfd_config.bash':
    ensure => file,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/profile/ctfd_config.bash',
  }
}
