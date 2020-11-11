# Install NCR containers
class profile::services::ncr::containers {
  require ::profile::services::ncr::conf
  require ::profile::services::ncr::registry

  docker_compose { 'ncr':
    ensure        => present,
    compose_files => [ '/opt/ncr/docker-compose.yaml' ],
  }
}
