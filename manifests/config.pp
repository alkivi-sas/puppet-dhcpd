class dhcpd::config (
    $domain_name       = $dhcpd::domain_name,
    $dns_servers       = $dhcpd::dns_servers,
    $routers           = $dhcpd::routers,
    $bootp             = $dhcpd::bootp,
    $booting           = $dhcpd::booting,
    $network           = $dhcpd::network,
    $netmask           = $dhcpd::netmask,
    $range_start       = $dhcpd::range_start,
    $range_end         = $dhcpd::range_end,
    $broadcast         = $dhcpd::broadcast,
    $listen_interfaces = $dhcpd::listen_interfaces,
) {
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$dhcpd::params::dhcpd_service_name],
  }

  concat{ $dhcpd::params::dhcpd_service_config:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$dhcpd::params::dhcpd_service_name],
  }

  concat::fragment{ 'dhcp_main':
    target  => $dhcpd::params::dhcpd_service_config,
    content => template('dhcpd/dhcpd.conf.erb'),
    order   => 01
  }

  file {  $dhcpd::params::dhcpd_service_default:
    content => template('dhcpd/etc_default.erb'),
  }

  if($firewall)
  {
    file { '/etc/iptables.d/11-dhcpd.rules':
      source  => 'puppet:///modules/dhcpd/dhcpd.rules',
      require => Package['alkivi-iptables'],
      notify  => Service['alkivi-iptables'],
    }
  }
}
