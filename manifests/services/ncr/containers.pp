# Install NCR containers
class profile::services::ncr::containers {
  require ::profile::services::ncr::conf

  docker_compose { 'ncr-containers':
    ensure        => present,
    compose_files => [ '/opt/ncr/docker-compose.yaml' ],
  }
}
