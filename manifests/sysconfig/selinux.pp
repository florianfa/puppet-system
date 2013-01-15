class system::sysconfig::selinux (
  $config = undef
) {
  if $config {
    $selinux = $config
  }
  else {
    $selinux = hiera_hash('system::sysconfig::selinux')
  }
  if $selinux {
    system::sysconfig::header { 'selinux': }
    system::sysconfig::entry { 'selinux-state':
      file     => 'selinux',
      var      => 'SELINUX',
      val      => $selinux['state'],
      noquotes => true,
    }
    system::sysconfig::entry { 'selinux-type':
      file     => 'selinux',
      var      => 'SELINUXTYPE',
      val      => $selinux['type'],
      noquotes => true,
    }
  }
}
