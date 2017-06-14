#
# Cookbook Name:: spl
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
apt_update 'update' if platform_family?('debian')

include recipe"chef-splunk::default"
