class dhcpd::config () {
  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service[$dhcpd::params::dhcpd_service_name],
  }

  file {  $dhcpd::params::dhcpd_service_config:
    content => template('dhcpd/dhcpd.conf.erb'),
  }

  file {  $dhcpd::params::dhcpd_service_default:
    content => template('dhcpd/etc_default.erb'),
  }

  file { '/etc/iptables.d/11-dhcpd.rules':
    source  => 'puppet:///modules/dhcpd/dhcpd.rules',
    require => Package['alkivi-iptables'],
    notify  => Service['alkivi-iptables'],
  }
}
