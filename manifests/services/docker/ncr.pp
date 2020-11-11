# Define the NCR containers
class profile::services::docker::ncr {

  require ::profile::ncr::registry
  include ::profile::ncr::containers

}
