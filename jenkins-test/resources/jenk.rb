resource_name :jenk

property :git, [true, false], default: false
property :none, [true, false], default: false
property :job, Integer, required: true
property :maven, [true, false], default: false
property :jfrog, [true, false], default: false
property :tomcat, [true, false], default: false
property :tomcat_ip, String
property :jfrog_ip, String
action :create do

job_config = "/var/chef/cache/job-config#{job}.xml"
template "/var/chef/cache/job-config#{job}.xml" do
    source 'job-config.xml'
    variables(
      git: git,
      none: none,
      maven: maven,
      jfrog: jfrog,
      tomcat: tomcat,
      tomcat_ip: tomcat_ip,
      jfrog_ip: jfrog_ip
    )
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
jenkins_command 'reload-configuration'

job_name="dengine#{job}"

jenkins_job job_name do
 config job_config
end
end

