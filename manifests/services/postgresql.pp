# Install postgresql server
class profile::services::postgresql {
  include ::profile::services::postgresql::server
}
