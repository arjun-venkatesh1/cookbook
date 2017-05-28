#dd
# Cookbook Name:: client
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "sensu::default"
execute "get update" do
  command "sudo apt-get update"

end
execute "get build esential" do
  command "sudo apt-get install build-essential -y"

end


sensu_gem 'sensu-plugins-memory-checks'
sensu_gem 'sensu-plugins-cpu-checks'
sensu_gem 'sensu-plugins-disk-checks'
sensu_gem 'sensu-plugins-jenkins'
sensu_gem 'sensu-plugins-http'
sensu_gem 'sensu-plugins-mysql'

execute "yum install" do
  command "sudo apt-get install yum -y"
end

#file "/etc/sensu/a.txt" do
# content "#{node['ec2']['public_ipv4']}"
#end


sensu_client "#{node.name}" do
   address "#{node['ec2']['public_ipv4']}"
  subscriptions ["base"] + ["#{node.name}"]
  socket('bind' => '127.0.0.1', 'port' => 3030)
end


mast= search(:node, 'role:pri')

template "/etc/sensu/conf.d/rabbitmq.json" do
 source 'rabbit.json.erb'
variables(
master_ip: "#{mast.first['cloud']['public_ipv4']}"
 )
end



include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"
include_recipe "sensu::client_service"

