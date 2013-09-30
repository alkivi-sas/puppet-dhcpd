class dhcpd::service () {
  service { $dhcpd::params::dhcpd_service_name:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}

