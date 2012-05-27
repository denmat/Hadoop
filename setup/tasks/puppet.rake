namespace :puppet do

  desc 'install puppet'
  task :gem_install_puppet do
    %x(gem install --remote puppet facter --no-ri --no-rdoc)
  end

  desc 'add puppet users and groups'
  task :puppet_accounts do
    %x(groupadd -g 53 puppet && useradd -u 53 -g 53 -m -d /var/lib/puppet puppet)
  end

  desc 'install all puppet requirements'
  task :run => [:gem_install_puppet, :puppet_accounts]

end
