
pluginjenkins_plugins 'installing plugin' do
  action :install
end

execute 'restarting jenkins' do
  command 'sudo service jenkins restart'
  user 'root'
end
