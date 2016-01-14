class circupon::backup {
  file { "/usr/local/bin/backup":
    mode => 755,
    owner => ubuntu,
    group => root,
    source => "puppet:///modules/circupon/mongo/backup",
  }

  cron { backup:
    command => "/usr/local/bin/backup > /tmp/backup.log 2>&1",
    user    => ubuntu,
    hour    => 10,
    minute  => 5,
    ensure  => present,
    require => File["/usr/local/bin/backup"],
  }
}
