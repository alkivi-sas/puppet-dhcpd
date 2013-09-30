# DHCP Module

This module will install and configure a DHCP server.

## Usage

### Minimal server configuration

```puppet
class { 'dhcpd': 
  domain_name       => 'mydomain.local',
  dns_servers       => ['192.168.0.253', '192.168.0.254'],
  routers           => ['192.168.0.254'],
  network           => '192.168.0.0',
  netmask           => '255.255.255.0',
  broadcast         => '192.168.0.255',
  range_start       => '192.168.0.1',
  range_end         => '192.168.0.100',
  network_prefix    => '192.168.0',
  listen_interfaces => ['eth0'],
  hosts             => { 'test' => { 'mac' => '78:2b:cb:9a:06:6b', 'ip' => '.101', 'comment' => 'employee' }, },
}
```
This will do the typical install, configure and service management. 
Hosts configuration will move shortly to have indenpendant declaration


### Host configuration

TODO


## Limitations

* This module has been tested on Debian Wheezy, Squeeze.

## License

All the code is freely distributable under the terms of the LGPLv3 license.

## Contact

Need help ? contact@alkivi.fr

## Support

Please log tickets and issues at our [Github](https://github.com/alkivi-sas/)
