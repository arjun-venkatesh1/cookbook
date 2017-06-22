#
# Cookbook Name:: cap
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

#set :deploy_to, "/home/ubuntu"

%w{ /opt/my_deploy/shared/config  /opt/my_deploy/releases/49023a2e4017515ed384283bd295f4b7cead7b32/config }.each do |dir|
  directory dir do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
  end
end

deploy "/opt/my_deploy/shared" do
  repo   "git://github.com/juanje/buildbot-example-config.git"
  action :deploy
end
