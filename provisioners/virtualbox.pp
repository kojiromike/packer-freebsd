node default {
    package { 'virtualbox-ose-additions':
      ensure   => installed,
      provider => 'pkgng',
    }
}
