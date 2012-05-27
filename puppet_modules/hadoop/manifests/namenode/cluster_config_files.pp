class hadoop::namenode::cluster_config_files {

  $cluster_config_files = hiera('hadoop_common::cluster_files')
  $namenode_defaults = { ensure  => present,
                         #require => Service['hadoop-0.20-namenode'],
                         notify  => Service['hadoop-0.20-namenode'],
			 owner   => root,
			 group   => root,
			 mode    => 0644,
		       }

  create_resources(file, $cluster_config_files, $namenode_defaults)

} #end class

