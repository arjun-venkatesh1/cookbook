#
# Cookbook Name:: sen
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "gpg public key" do
  command "wget -q http://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | sudo apt-key add -"
end

template "/etc/apt/sources.list.d/sensu.list" do
  source "sensu.list.erb"
  owner "root"
  group "root"
  mode 0644
end

execute "apt-get-update" do
  command "apt-get update"
end

apt_package 'sensu' do
  action :install
end

template "/etc/sensu/conf.d/client.json" do
  source "client.json.erb"
  owner "root"
  group "root"
  mode 0644
end


template "/etc/sensu/conf.d/transport.json" do
  source "transport.json.erb"
  owner "root"
  group "root"
  mode 0644
end


template "/etc/sensu/conf.d/api.json" do
  source "api.json.erb"
  owner "root"
  group "root"
  mode 0644
end

apt_package 'redis-server' do
  action :install
end

template "/etc/sensu/conf.d/redis.json" do
  source "redis.json.erb"
  owner "root"
  group "root"
  mode 0644
end


execute "erlang" do
  command "sudo wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb sudo dpkg -i erlang-solutions_1.0_all.deb sudo apt-get update sudo apt-get -y install erlang-nox"
end


remote_file "/tmp/vcider_#{version}_#{arch}.deb" do
  source "https://my.vcider.com/m/downloads/vcider_#{version}_#{arch}.deb"
  mode 0644
  checksum "" # PUT THE SHA256 CHECKSUM HERE
end

dpkg_package "vcider" do
  source "/tmp/vcider_#{version}_#{arch}.deb"
  action :install
end

