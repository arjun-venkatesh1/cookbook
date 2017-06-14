include_recipe 'jenkins_server_wrapper::default'

jenkins_plugin 'disk-usage' do
  version '0.23'
end

jenkins_plugin 'ant' do
  version '1.5'
  install_deps false
end

jenkins_plugin 'artifactory' do
  version '2.10.4'
  install_deps false
end

jenkins_plugin 'bouncycastle-api' do
  source 'http://updates.jenkins-ci.org/download/plugins/bouncycastle-api/2.16.1/bouncycastle-api.hpi'
  install_deps false
end



jenkins_plugin 'buildresult-trigger' do
  version '0.17'
  install_deps false
end



jenkins_plugin 'config-file-provider' do
  version '2.15.7'
  install_deps false
end


jenkins_plugin 'credentials' do
  version '2.1.13'
  install_deps false
end


jenkins_plugin 'deploy' do
  version '1.10'
  install_deps false
end



jenkins_plugin 'display-url-api' do
 source 'http://updates.jenkins-ci.org/download/plugins/display-url-api/2.0/display-url-api.hpi'
  install_deps false
end


jenkins_plugin 'git-client' do
  version '2.4.5'
  install_deps false
end

jenkins_plugin 'git' do
  version '3.3.0'
  install_deps false
end


jenkins_plugin 'github-api' do
  version '1.85'
  install_deps false
end


#jenkins_plugin 'github-pullrequest' do
#  version '0.1.0-rc24'
#  install_deps false
#end


jenkins_plugin 'github' do
  version '1.27.0'
  install_deps false
end


jenkins_plugin 'gradle' do
  version '1.26'
  install_deps false
end


jenkins_plugin 'icon-shim' do
  version '2.0.3'
  install_deps false
end


jenkins_plugin 'ivy' do
  version '1.27.1'
  install_deps false
end


jenkins_plugin 'javadoc' do
  version '1.4'
  install_deps false
end

jenkins_plugin 'ace-editor' do
  version '1.1'
  install_deps false
end

jenkins_plugin 'jquery-detached' do
  version '1.2.1'
  install_deps false
end

jenkins_plugin 'junit' do
  version '1.20'
  install_deps false
end

jenkins_plugin 'mailer' do
  version '1.20'
  install_deps false
end

jenkins_plugin 'matrix-auth' do
  version '1.5'
  install_deps false
end

jenkins_plugin 'matrix-project' do
  version '1.10'
  install_deps false
end

jenkins_plugin 'maven-plugin' do
  version '2.15.1'
  install_deps false
end

jenkins_plugin 'antisamy-markup-formatter' do
  version '1.5'
  install_deps true
end


jenkins_plugin 'workflow-api' do
  version '2.13'
  install_deps false
end


jenkins_plugin 'workflow-cps' do
  version '2.13'
  install_deps false
end


jenkins_plugin 'workflow-scm-step' do
  version '2.4'
  install_deps false
end


jenkins_plugin 'workflow-step-api' do
  version '2.9'
  install_deps false
end

jenkins_plugin 'workflow-support' do
  version '2.14'
  install_deps false
end

jenkins_plugin 'plain-credentials' do
  version '1.4'
  install_deps false
end

jenkins_plugin 'scm-api' do
  version '2.1.1'
  install_deps false
end

jenkins_plugin 'script-security' do
  version '1.27'
  install_deps false
end

jenkins_plugin 'ssh-credentials' do
  version '1.13'
  install_deps false
end


jenkins_plugin 'structs' do
  version '1.6'
  install_deps false
end


jenkins_plugin 'token-macro' do
  version '2.1'
  install_deps false
end

jenkins_plugin 'windows-slaves' do
  version '1.3.1'
  install_deps false
end
