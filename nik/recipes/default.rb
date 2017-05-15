#
# Cookbook Name:: nik
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

apt_update 'update' if platform_family?('debian')

include_recipe 'nik::docs_example'
include_recipe 'nik::helloworld_example'
