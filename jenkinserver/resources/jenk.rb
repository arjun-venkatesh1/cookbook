resource_name :jenk

property :git, String, default: 'false'
property :svn, String, default: 'false'

action :create do
template "/var/chef/cache/job-config.xml" do
    source 'job-config.xml'
    variables(
      git: '#{git}',
      svn: '#{svn}'
    )
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end
