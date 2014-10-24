define :opsworks_sheer do
  deploy = params[:deploy_data]
  application = params[:app]

  execute "/usr/local/bin/npm install" do
    cwd "#{deploy[:deploy_to]}/current"
  end

  ['/etc/sv', '/var/log/sheer'].each do |d|
    directory d do
      action :create
      owner "root"
      group "root"
      mode "0755"
      recursive true
    end
  end

  template "/var/log/sheer/config" do
    source "sv-sheer-log-conf.erb"
    mode '0644'
  end

  runit_service 'sheer'
end
