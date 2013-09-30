class dhcpd::install () {
  package { $dhcpd::params::dhcpd_package_name:
    ensure => installed,
  }
}
