#
# Cookbook Name:: frwd
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'splunk::forwarder'

ip= search(:node, 'role:*dummi*')

execute 'add forwarder' do
  cwd '/opt/splunk/bin'
  command "./splunk add forward-server #{ip.first['cloud']['public_ipv4']}:9997"
end



execute 'deploy' do
  cwd '/opt/splunk/bin'
  command "./splunk set deploy-poll #{ip.first['cloud']['public_ipv4']}:8089"
end

execute 'restart' do
  cwd '/opt/splunk/bin'
  command "./splunk restart"
end
