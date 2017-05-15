#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
# create a mysql database
# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password node['awesome_customers_ubuntu']['database']['root_password']
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

mysql_database 'oracle_rules' do
  connection ({:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']})
  action :create
end

# create a sql server database
sql_server_database 'mr_softie' do
  connection ({:host => "127.0.0.1", :port => node['sql_server']['port'], :username => 'sa', :password => node['sql_server']['server_sa_password']})
  action :create
end

# create a postgresql database
postgresql_database 'mr_softie' do
  connection ({:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']})
  action :create
end

# create a postgresql database with additional parameters
postgresql_database 'mr_softie' do
  connection ({:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']})
  template 'DEFAULT'
  encoding 'DEFAULT'
  tablespace 'DEFAULT'
  connection_limit '-1'
  owner 'postgres'
  action :create
end

# externalize conection info in a ruby hash
mysql_connection_info = {:host => "localhost", :username => 'root', :password => node['mysql']['server_root_password']}
sql_server_connection_info = {:host => "localhost", :port => node['sql_server']['port'], :username => 'sa', :password => node['sql_server']['server_sa_password']}
postgresql_connection_info = {:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']}

# same create commands, connection info as an external hash
mysql_database 'foo' do
  connection mysql_connection_info
  action :create
end
sql_server_database 'foo' do
  connection sql_server_connection_info
  action :create
end
postgresql_database 'foo' do
  connection postgresql_connection_info
  action :create
end

# create database, set provider in resource parameter
database 'bar' do
   connection mysql_connection_info
   provider Chef::Provider::Database::Mysql
   action :create
end
database 'bar' do
  connection sql_server_connection_info
  provider Chef::Provider::Database::SqlServer
  action :create
end
database 'bar' do
  connection postgresql_connection_info
  provider Chef::Provider::Database::Postgresql
  action :create
end

# drop a database
mysql_database "baz" do
  connection mysql_connection_info
  action :drop
end

# query a database
mysql_database "flush the privileges" do
  connection mysql_connection_info
  sql "flush privileges"
  action :query
end
