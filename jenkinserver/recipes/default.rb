#
# Cookbook Name:: jenkinserver
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#include_recipe 'jenkins::java'
include_recipe 'jenkins::master'


template "#{node['jenkins']['master']['home']}/config.xml" do
  source "config.xml.erb"
end

template "#{node['jenkins']['master']['home']}/hudson.tasks.Maven.xml" do
 source 'hudson.tasks.Maven.xml.erb'
end

#jenkins_command 'reload-configuration'

job_config = File.join(Chef::Config[:file_cache_path], 'job-config.xml')

jenk 'with_git' do
  git 'true'
  svn 'false'
  action :create
end
jenkins_command 'reload-configuration'
#template job_config do
#  source 'webapp-job-config.xml.erb'
#end

jenkins_job 'Web' do
 config job_config
end

