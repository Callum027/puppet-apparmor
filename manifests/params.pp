#
# apparmor puppet module
# https://github.com/artem-sidorenko/puppet-apparmor
#
# Author Artem Sidorenko artem@2realities.com
#
# Copyright 2014 Artem Sidorenko and contributors.
# Copyright 2014 Deutsche Telekom AG
# See the COPYRIGHT file at the top-level directory of this distribution
# and at https://github.com/artem-sidorenko/puppet-apparmor/blob/master/COPYRIGHT
#
class apparmor::params (
  $package_ensure   = 'present',
  $service_enable   = true,
  $service_ensure   = 'running',
  $service_manage   = true,
  $profile_location = '/etc/apparmor.d',
){

  case $::osfamily {
    'Debian': {
      $package_names = ['apparmor','apparmor-utils']
      $service_name  = 'apparmor'
    }
    default: {
      fail("Unsupported osfamily (${::osfamily})")
    }
  }
}
