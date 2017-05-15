#
# Cookbook Name:: allplugin
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'nikplugin::default'

jenkins_plugin 'ant plugin' do
  version '1.5'
  install_deps false
  notifies :restart, 'runit_service[jenkins]', :immediately
end

jenkins_plugin 'Artifactory Plugin' do
  version '2.10.4'
  install_deps false
end

jenkins_plugin 'bouncycastle API Plugin' do
  version '2.16.1'
  install_deps false
end



jenkins_plugin 'BuildResultTrigger Plug-in' do
  version '0.17'
  install_deps false
end



jenkins_plugin 'Config File Provider Plugin' do
  version '2.15.7'
  install_deps false
end


jenkins_plugin 'Credentials Plugin' do
  version '2.1.13'
  install_deps false
end


jenkins_plugin 'Deploy to container Plugin' do
  version '1.10'
  install_deps false
end



jenkins_plugin 'Display URL API' do
  version '2.0'
  install_deps false
end


jenkins_plugin 'Git client plugin' do
  version '2.4.5'
  install_deps false
end

jenkins_plugin 'Git plugin' do
  version '3.3.0'
  install_deps false
end


jenkins_plugin 'GitHub API Plugin' do
  version '1.85'
  install_deps false
end


jenkins_plugin 'GitHub Integration Plugin' do
  version '0.1.0-rc24'
  install_deps false
end


jenkins_plugin 'GitHub plugin' do
  version '1.27.0'
  install_deps false
end


jenkins_plugin 'Gradle Plugin' do
  version '1.26'
  install_deps false
end


jenkins_plugin 'Icon Shim Plugin' do
  version '2.0.3'
  install_deps false
end


jenkins_plugin 'Ivy Plugin' do
  version '1.27.1'
  install_deps false
end


jenkins_plugin 'Javadoc Plugin' do
  version '1.4'
  install_deps false
end

jenkins_plugin 'JavaScript GUI Lib: ACE Editor bundle plugin' do
  version '1.1'
  install_deps false
end

jenkins_plugin 'JavaScript GUI Lib: jQuery bundles (jQuery and jQuery UI) plugin' do
  version '1.2.1'
  install_deps false
end

jenkins_plugin 'JUnit Plugin' do
  version '1.20'
  install_deps false
end

jenkins_plugin 'Mailer Plugin' do
  version '1.20'
  install_deps false
end

jenkins_plugin 'Matrix Authorization Strategy Plugin' do
  version '1.5'
  install_deps false
end

jenkins_plugin 'Matrix Project Plugin' do
  version '1.10'
  install_deps false
end

jenkins_plugin 'Maven Integration plugin' do
  version '2.15.1'
  install_deps false
end

jenkins_plugin 'OWASP Markup Formatter Plugin' do
  version '1.5'
  install_deps true
end


jenkins_plugin 'Pipeline: API' do
  version '2.13'
  install_deps false
end


jenkins_plugin 'Pipeline: Groovy' do
  version '2.13'
  install_deps false
end


jenkins_plugin 'Pipeline: SCM Step' do
  version '2.4'
  install_deps false
end


jenkins_plugin 'Pipeline: Step API' do
  version '2.9'
  install_deps false
end

jenkins_plugin 'Pipeline: Supporting APIs' do
  version '2.14'
  install_deps false
end

jenkins_plugin 'Plain Credentials Plugin' do
  version '1.4'
  install_deps false
end

jenkins_plugin 'SCM API Plugin' do
  version '2.1.1'
  install_deps false
end

jenkins_plugin 'Script Security Plugin' do
  version '1.27'
  install_deps false
end

jenkins_plugin 'SSH Credentials Plugin' do
  version '1.13'
  install_deps false
end


jenkins_plugin 'Structs Plugin' do
  version '1.6'
  install_deps false
end


jenkins_plugin 'Token Macro Plugin' do
  version '2.1'
  install_deps false
end

jenkins_plugin 'Windows Slaves Plugin' do
  version '1.3.1'
  install_deps false
end

