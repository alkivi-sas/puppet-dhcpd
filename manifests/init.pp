class dhcpd (
  $domain_name,
  $dns_servers,
  $routers,
  $network,
  $netmask,
  $range_start,
  $range_end,
  $broadcast,
  $bootp             = false,
  $booting           = false,
  $listen_interfaces = ['eth0'],
  $motd              = true,
  $firewall          = true,
) {

  if($motd)
  {
    motd::register{ 'DHCP Server': }
  }

  validate_string($domain_name)
  validate_array($dns_servers)
  validate_array($routers)
  validate_string($network)
  validate_string($netmask)
  validate_string($range_start)
  validate_string($range_end)
  validate_string($broadcast)
  validate_array($listen_interfaces)


  # declare all parameterized classes
  class { 'dhcpd::params': }
  class { 'dhcpd::install': }
  class { 'dhcpd::config': }
  class { 'dhcpd::service': }

  # declare relationships
  Class['dhcpd::params'] ->
  Class['dhcpd::install'] ->
  Class['dhcpd::config'] ->
  Class['dhcpd::service']
}

