define hadoop::namenode::create_namenode_dirs {

  $disklist = $name
  $secondary = hiera('hadoop::namenode::secondarynamenode', undef)

  file {"${disklist}/hadoop":
    ensure  => directory,
    owner   => 'hdfs',
    group   => 'hadoop',
    mode    => 0755,
  }
  file {"${disklist}/hadoop/dfs":
    ensure  => directory,
    owner   => 'hdfs',
    group   => 'hadoop',
    mode    => 0755,
    require => File["${disklist}/hadoop"],
  }
  file {"${disklist}/hadoop/dfs/namenode":
    ensure  => directory,
    owner   => 'hdfs',
    group   => 'hadoop',
    mode    => 0700,
    require => File["${disklist}/hadoop/dfs"],
  }

  if $secondary {
    file {"${disklist}/hadoop/dfs/second_namenode":
      ensure  => directory,
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 0700,
      require => File["${disklist}/hadoop/dfs"],
    }
  }
} #end class

