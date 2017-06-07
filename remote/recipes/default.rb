#
# Cookbook Name:: remote
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
apt_update 'update'


file "/etc/mysql/my.cnf" do
content "my.erb"
end


mysql_service 'nik' do
  bind_address '0.0.0.0'
  port '3306'
  socket '/var/run/mysql-default/mysqld.sock'
  initial_root_password 'root123'
  action [:create, :start]
end
mysql_config 'default' do
  source 'settings.erb'
  notifies :restart, 'mysql_service[nik]'
  action :create
end
