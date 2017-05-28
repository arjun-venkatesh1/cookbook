#
# Cookbook Name:: mascli
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


sensu_check "memory" do
  command "/opt/sensu/embedded/bin/check-memory-percent.rb -w 90 -c 95"
 # handlers ["default"]
  subscribers ["base"]
  interval 60
  additional(:notification => "memory error", :occurrences => 5)
end

sensu_check "cpu" do
  command "/opt/sensu/embedded/bin/check-cpu.rb -w 80 -c 90 "
 # handlers ["default"]
  subscribers ["base"]
  interval 60
  additional(:notification => "cpu error", :occurrences => 5)
end

sensu_check "disk" do
  command "/opt/sensu/embedded/bin/check-disk-usage.rb -w 80 -c 90"
 # handlers ["default"]
  subscribers ["base"]
  interval 60
  additional(:notification => "disk error", :occurrences => 5)
end

sensu_check "jenkins-job" do
  command "/opt/sensu/embedded/bin/check-jenkins-job-status.rb  --j ruby --url http://52.34.123.210:8080/jenkins/"
 # handlers ["default"]
  subscribers ["jenkins"]
  interval 60
  additional(:notification => "jenkins error", :occurrences => 5)
end

sensu_check "jenkins-server" do
  command "/opt/sensu/embedded/bin/check-jenkins.rb -s 52.34.123.210 p 8080 -u /jenkins/metrics/currentUser/ping"
 # handlers ["default"]
  subscribers ["jenkins"]
  interval 60
  additional(:notification => "jenkins error", :occurrences => 5)
end

sensu_check "mysql" do
  command "/opt/sensu/embedded/bin/check-mysql-alive.rb -h :::mysql.host::: -u :::mysql.user::: -p :::mysql.password:::"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 300
  additional(:notification => "mysql error", :occurrences => 5)
end



include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"
include_recipe "sensu::client_service"
include_recipe "sensu::default"
include_recipe "uchiwa::default"

