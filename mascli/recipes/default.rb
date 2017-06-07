#
# Cookbook Name:: mascli
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
require 'json'
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
sensu_gem 'sensu-plugins-process-checks'


ip= search(:node, 'role:nik')


if ip.empty?
ipjen = 'localhost'
else
ip= search(:node, 'role:nik')
ipjen = ip.first['cloud']['public_ipv4']


remote_file '/home/jobs.json' do
  source "http://#{ip.first['cloud']['public_ipv4']}:8080/api/json?tree=jobs[name,builds[number,actions[parameters[name]]]]"
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
if ::File.exists?('/home/jobs.json')
jobs =::File.read('/home/jobs.json').chomp
# "#{/home/jobs.json}"
#if ::File.exists?('/home/jobs.json') 
new = JSON.parse(jobs)




new["jobs"].each do |lol|

sensu_check "jenkins-job-#{lol["name"]}" do
  command "/opt/sensu/embedded/bin/check-jenkins-job-status.rb  --j #{lol["name"]}  --url http://#{ipjen}:8080/"
 # handlers ["default"]
  subscribers ["jenkins"]
  interval 60
  additional(:notification => "jenkins error", :occurrences => 5)
end


sensu_check "jenkins-build-#{lol["name"]}" do
  command "/opt/sensu/embedded/bin/check-jenkins-build-time.rb  --j #{lol["name"]}  --url http://#{ipjen}:8080/"
 # handlers ["default"]
  subscribers ["jenkins"]
  interval 60
  additional(:notification => "jenkins error", :occurrences => 5)
end
file '/home/ubuntu/a.txt' do
  content "#{lol["name"]}"
  mode '0755'
  owner 'root'
  group 'root'
end
end
end
end

#ip= search(:node, 'role:nik')

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

#sensu_check "jenkins-server" do
 # command "/opt/sensu/embedded/bin/check-jenkins.rb -s #{ip.first['cloud']['public_ipv4']} p 8080 -u /jenkins/metrics/currentUser/ping"
 # handlers ["default"]
 # subscribers ["jenkins"]
 # interval 60
 # additional(:notification => "jenkins error", :occurrences => 5)
#end

sensu_check "jenkins-process-check" do
  command "/opt/sensu/embedded/bin/check-process.rb -p jenkins"
 # handlers ["default"]
  subscribers ["jenkins"]
  interval 60
  additional(:notification => "jenkins error", :occurrences => 5)
end

#sensu_check "jenkins-health" do
 # command "/opt/sensu/embedded/bin/check-jenkins-health.rb -s #{ip.first['cloud']['public_ipv4']} p 8080 -u /jenkins/metrics/currentUser/healthcheck"
 # handlers ["default"]
 # subscribers ["jenkins"]
 # interval 60
 # additional(:notification => "jenkins-health error", :occurrences => 5)
#end

ip= search(:node, 'role:role1')

sensu_check "mysql" do
  command "/opt/sensu/embedded/bin/check-mysql-alive.rb -u :::mysql.user::: -p :::mysql.password::: -h :::mysql.host:::"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
  additional(:notification => "mysql error", :occurrences => 5)
end

sensu_check "mysql-process-check" do
  command "/opt/sensu/embedded/bin/check-process.rb -p mysql"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
  additional(:notification => "mysql process error", :occurrences => 5)
end

sensu_check "mysql-connections" do
  command "/opt/sensu/embedded/bin/check-mysql-connections.rb -h localhost --warnnum=100 --critnum=128 --ini '/etc/sensu/my.cnf'"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
additional(:notification => "mysql error", :occurrences => 5)
end

sensu_check "mysql-disksize" do
  command "/opt/sensu/embedded/bin/check-mysql-disk.rb -h :::mysql.host::: -u :::mysql.user::: -p :::mysql.password:::"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
  additional(:notification => "mysql error", :occurrences => 5)
end

sensu_check "mysql-status" do
  command "/opt/sensu/embedded/bin/check-mysql-status.rb -u :::mysql.user::: -p :::mysql.password::: -h :::mysql.host:::"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
  additional(:notification => "mysql error", :occurrences => 5)
end

sensu_check "mysql-innodb-lock" do
  command "/opt/sensu/embedded/bin/check-mysql-innodb-lock.rb -u :::mysql.user::: -p :::mysql.password::: -h :::mysql.host:::"
 # handlers ["default"]
  subscribers ["mysql"]
  interval 60
  additional(:notification => "mysql error", :occurrences => 5)
end


sensu_check "tomcat" do
  command "/opt/sensu/embedded/bin/check-process.rb -p tomcat"
 # handlers ["default"]
  subscribers ["tomcat"]
  interval 60
  additional(:notification => "tomcat error", :occurrences => 5)
end




include_recipe "sensu::rabbitmq"
include_recipe "sensu::redis"
include_recipe "sensu::server_service"
include_recipe "sensu::api_service"
include_recipe "sensu::client_service"
include_recipe "sensu::default"
include_recipe "uchiwa::default"


