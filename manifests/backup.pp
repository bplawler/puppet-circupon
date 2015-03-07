class circupon::backup {
  file { "/usr/local/bin/backup":
    mode => 755,
    owner => ubuntu,
    group => root,
    source => "puppet:///modules/circupon/mongo/backup",
  }

  file { "s3-bash":
    path => "/usr/local/bin/s3-bash",
    source => "puppet:///modules/circupon/mongo/s3-bash-master",
    owner => ubuntu,
    group => root,
    recurse => true,
  }

  cron { backup:
    command => "/usr/local/bin/backup",
    user    => root,
    hour    => 10,
    minute  => 5,
    ensure  => present,
    require => File["/usr/local/bin/backup"],
  }
}
