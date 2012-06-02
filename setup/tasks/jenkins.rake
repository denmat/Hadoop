unless ENV['windir']
  require 'rubygems'
  require 'vagrant'
else
  path = 'C:/vagrant/vagrant/embedded/lib/ruby/gems/1.9.1/gems/vagrant-1.0.3/lib'
  $:.unshift path
end

namespace :git do

  desc 'check out revision from github'
  task :git_checkout do
    Dir.mkdir('project/shared_folder') unless Dir.exits?('project/shared_folder')
    system('git clone https://github.com/denmat/puppet_master.git project/shared_folder/puppet')
  end

end
   
namespace :jenkins_build do

  desc 'Build the run the vagrant jobs to lauch instances'
  task :up do
    puts "about to launch the nodes specified in the vagrant file"
    env = Vagrant::Environment.new
    env.cli("up")
    puts "complete setup"
  end

  desc 'Destroys the vagrant nodes'
  task :destroy do
    puts "about to destroy vagrant instances"
    env = Vagrant::Environment.new
    env.cli("destroy")
    puts "instances destroyed"
  end

end
