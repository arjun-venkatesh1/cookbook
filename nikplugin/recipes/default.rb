#
# Cookbook Name:: nikplugin
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install some plugins needed, but not installed on jenkins2 by default
jenkins_plugins = %w(
  mailer
  credentials
  ssh-credentials
  ssh-slaves
)
jenkins_plugins.each do |plugin|
  jenkins_plugin plugin do
    notifies :execute, 'jenkins_command[safe-restart]', :immediately
  end
end

jenkins_command 'safe-restart' do
  action :nothing
end
