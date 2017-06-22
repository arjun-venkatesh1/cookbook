apt_update 'update' if platform_family?('debian')


nik = "#{node.name}"


#mysql= search(:node, "role:role1 AND name:*#{nik[-3..-1]}")

#ruby_block "insert_line" do
#  block do
#    file = Chef::Util::FileEdit.new("/etc/hosts")
#    file.insert_line_if_no_match("#{mysql.first['cloud']['public_ipv4']}", "#{mysql.first['cloud']['public_ipv4']} database_ip")
#    file.write_file
#  end
#end

include_recipe 'test::docs_example'
include_recipe 'test::helloworld_example'
