class circupon::solr {
  file { "/usr/share/solr/web/WEB-INF/classes":
    mode => 755,
    ensure => directory,
    owner => root,
    group => root,
  }

  file { "/usr/share/solr/web/WEB-INF/classes/logging.properties":
    mode => 644,
    owner => root,
    group => root,
    source => "puppet:///modules/circupon/solr/classes/logging.properties",
    require => File [ "/usr/share/solr/web/WEB-INF/classes" ],
  }

  file { "/usr/share/solr/conf/schema.xml":
    mode => 644,
    owner => root,
    group => root,
    source => "puppet:///modules/circupon/solr/conf/schema.xml",
  }

  file { "/usr/share/solr/conf/solrconfig.xml":
    mode => 644,
    owner => root,
    group => root,
    source => "puppet:///modules/circupon/solr/conf/solrconfig.xml",
  }

  file { "/usr/share/solr/conf/synonyms.txt":
    mode => 644,
    owner => root,
    group => root,
    source => "puppet:///modules/circupon/solr/conf/synonyms.txt",
  }

  file { "/usr/share/solr/conf/stopwords.txt":
    mode => 644,
    owner => root,
    group => root,
    source => "puppet:///modules/circupon/solr/conf/stopwords.txt",
  }

  service { "tomcat6" :
    ensure => running,
    enable => true,
    hasrestart => true,
    hasstatus => true,
    subscribe => File["/usr/share/solr/conf/schema.xml", "/usr/share/solr/conf/solrconfig.xml", "/home/ubuntu/solr-lib"],
  }
}
