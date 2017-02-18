# Private class
class zfsonlinux::service {

  include ::zfsonlinux

  service { ['zfs.target', 'zfs-import-cache.service', 'zfs-mount.service']:
    ensure     => $::zfsonlinux::service_ensure,
    enable     => $::zfsonlinux::service_enable,
    hasstatus  => $::zfsonlinux::service_hasstatus,
    hasrestart => $::zfsonlinux::service_hasrestart,
    status     => $::zfsonlinux::service_status
  }

}
