#
# Cookbook Name:: jenkins_server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#include_recipe 'apt::default'
#include_recipe 'java::default'

#node.override['jenkins']['master']['install_method'] = 'war'

#Install Jenkins
#include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

#Global configuration
Chef::Log.info("Java home: #{node['jenkins']['java']}")

template "#{node['jenkins']['master']['home']}/config.xml" do
  source "config.xml.erb"
end

template "#{node['jenkins']['master']['home']}/hudson.tasks.Maven.xml" do
  source 'hudson.tasks.Maven.xml.erb'
end


jenkins_plugin 'artifactory' do
  # source 'https://updates.jenkins.io/download/plugins/artifactory/2.10.3/artifactory.hpi'
  version '2.7.0'
  install_deps true
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end

#jenkins_plugin 'artifactory' do
#  action :enable
#  notifies :restart, 'runit_service[jenkins]', :immediately
#end

jenkins_plugin 'build-pipeline-plugin' do
  install_deps true
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end

jenkins_plugin 'git' do
  # source 'https://updates.jenkins.io/download/plugins/artifactory/2.10.3/artifactory.hpi'
  version '3.0.0'
  install_deps true
  action :install
  notifies :restart, 'service[jenkins]', :immediately
end

jenkins_command 'reload-configuration'

#Job creation
job_config = File.join(Chef::Config[:file_cache_path], 'job-config.xml')

template job_config do
  source 'webapp-job-config.xml.erb'
end

jenkins_job 'dengine' do
  config job_config
end

