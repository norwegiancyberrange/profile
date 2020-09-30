# Time is important
class profile::baseconfig::time {

  $ntpservers = lookup('profile::ntp::servers')
  $tz = lookup('profile::ntp::timezone', {
    'value_type'    => String,
    'default_value' => 'Europe/Oslo',
  })

  class { '::timezone':
    timezone => $tz,
  }

  class { '::systemd':
    manage_timesyncd => true,
    ntp_server       => $ntpservers,
  }
}
