include_recipe 'deploy'
include_recipe 'runit'

node[:deploy].each do |application, deploy|
  if application != node['sheer']['application_name']
    Chef::Log.debug("Skipping sheer-deploy application #{application}")
    next
  end

  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  current_dir = ::File.join(deploy[:deploy_to], 'current')

  opsworks_sheer do
    deploy_data deploy
    app application
  end

  execute "/sbin/sv restart #{node['sheer']['application_name']}" do
  end
  
end
