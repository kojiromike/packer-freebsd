node default {
    group { 'wheel':
      ensure => present,
    }
    user { 'vagrant':
        ensure     => present,
        comment    => 'Vagrant User',
        shell      => '/bin/sh',
        managehome => true,
        groups     => ['wheel'],
        require    => Group['wheel'],
    } ->
    file { '/home/vagrant/.ssh':
      ensure => directory,
      owner  => 'vagrant',
      group  => 'vagrant',
      mode   => '0700',
    } ->
    ssh_authorized_key { 'Vagrant Insecure Public Key':
        user   => 'vagrant',
        ensure => present,
        type   => 'rsa',
        key    => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ==',
    }
}
