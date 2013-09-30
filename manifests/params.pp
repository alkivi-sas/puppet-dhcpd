class dhcpd::params () {
  case $::operatingsystem {
    /(Ubuntu|Debian)/: {
      $dhcpd_service_config  = '/etc/dhcp/dhcpd.conf'
      $dhcpd_service_default = '/etc/default/isc-dhcp-server'
      $dhcpd_service_name    = 'isc-dhcp-server'
      $dhcpd_package_name    = 'isc-dhcp-server'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

