# Include NCR databases
class profile::services::postgresql::ncr {
  include ::profile::services::ncr::db::portal
}
