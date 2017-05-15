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
jenk 'with_git' do
  job 44
  git true
  none false
  maven true
  tomcat true
  jfrog true
  tomcat_ip '54.202.145.32'
  jfrog_ip '52.27.116.116'
  action :create
end
#jenkins_command 'reload-configuration'


