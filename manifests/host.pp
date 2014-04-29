define dhcpd::host(
  $mac,
  $ip,
  $hostname= $title,
  $order   = 02,
  $comment = undef,
) {

  validate_string($mac)
  validate_string($ip)
  validate_string($hostname)

  if($comment)
  {
    validate_string($comment)
  }

  if(!is_ip_address($ip))
  {
    fail("ip '${ip}' is not an ip address")
  }

  if(!is_mac_address($mac))
  {
    fail("mac '${mac}' is not a mac address")
  }

  concat::fragment{ "dhcp_host_${ip}":
    target  => $dhcpd::params::dhcpd_service_config,
    content => template('dhcpd/host.conf.erb'),
    order   => $order,
  }
}
