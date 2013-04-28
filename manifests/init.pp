# == Class: zfsonlinux
#
# Full description of class zfsonlinux here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { zfsonlinux:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux (
  $zfs_package_name       = $zfsonlinux::params::zfs_package_name,
  $zfs_service_name       = $zfsonlinux::params::zfs_service_name

) inherits zfsonlinux::params {

  include zfsonlinux::repo

  $package_dependencies = $zfsonlinux::params::package_dependencies
  ensure_packages($package_dependencies)

  package { 'zfs':
    ensure  => 'installed',
    name    => $zfs_package_name,
    require => Class['zfsonlinux::repo'],
  }

  service { 'zfs':
    ensure  => undef,
    enable  => true,
    name    => $zfs_service_name,
    require => Package['zfs'],
  }

}
