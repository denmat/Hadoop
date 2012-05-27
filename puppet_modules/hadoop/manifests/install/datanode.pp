class hadoop::install::datanode {
  include hadoop::install 

  $hadoop_datanode_list = hiera('hadoop_datanode::hadoop_package_list')

  create_resources(package, $hadoop_datanode_list)

} #end class

