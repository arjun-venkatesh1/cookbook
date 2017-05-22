#
# Cookbook Name:: jenkins-test
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#file = File.join(Chef::Config[:file_cache_path], 'config.xml')
apt_package 'maven' do
  action :install
end
frog= search(:node, 'role:*jfrog*')
template "#{node['jenkins']['master']['home']}/config.xml" do
  source "config.xml.erb"
end

template "#{node['jenkins']['master']['home']}/hudson.tasks.Maven.xml" do
 source 'hudson.tasks.Maven.xml.erb'
end

template "#{node['jenkins']['master']['home']}/jenkins.model.ArtifactManagerConfiguration.xml" do
 source 'jenkins.model.ArtifactManagerConfiguration.xml.erb'
variables(
 art_ip: "#{frog.first['cloud']['public_ipv4']}"
 )
end

template "#{node['jenkins']['master']['home']}/org.jfrog.hudson.ArtifactoryBuilder.xml" do
 source 'org.jfrog.hudson.ArtifactoryBuilder.xml.erb'
variables(
 art_ip: "#{frog.first['cloud']['public_ipv4']}"
 )
end

execute "restart jenkins" do
  command "service jenkins restart"

end

job_config = File.join(Chef::Config[:file_cache_path], 'job-config.xml')

jenk 'with_git' do
  job 22
  git true
  none false
  action :create
end

jenk 'with_git' do
  job 33
  git false
  none true
  action :create
end
tom= search(:node, 'role:*tom*')
#frog= search(:node, 'role:*jfrog*')
 # puts result['ip']
 # puts result['kernel_version']


jenk 'with_git' do
  job 44
  git true
  none false
  maven true
  tomcat true
  jfrog true
#  db_server = search(:node, 'role:*tom*')
  tomcat_ip "#{tom.first['cloud']['public_ipv4']}"
#  tomcat "#{private_ip}"
 
  jfrog_ip "#{frog.first['cloud']['public_ipv4']}"
  action :create
end
#jenkins_command 'reload-configuration'


