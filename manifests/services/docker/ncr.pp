# Define the NCR containers
class profile::services::docker::ncr {

  require ::profile::services::ncr::registry
  include ::profile::services::ncr::containers

}
