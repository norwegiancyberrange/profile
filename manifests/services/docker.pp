# Install docker
class profile::services::docker {

  class { '::docker': }
  class { '::docker::compose': }
}
