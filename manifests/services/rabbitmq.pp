# Install rabbitmq server
class profile::services::rabbitmq {

  $password = lookup('profile::rabbitmq::password')

  if ( $facts['networking']['scope6'] =~ /global/ ) {
    $ipv6 = true
  } else {
    $ipv6 = false
  }

  class { '::rabbitmq':
    delete_guest_user => true,
    ipv6              => $ipv6
  }
  -> rabbitmq_user { 'rabbit':
    admin    => true,
    password => $password,
  }
  -> rabbitmq_user_permissions { 'rabbit@/':
    configure_permission => '.*',
    write_permission     => '.*',
    read_permission      => '.*',
  }
}
