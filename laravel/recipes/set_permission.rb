node[:deploy].each do |application, deploy|
  execute "storage_permission" do
    command "chmod -R 777 #{deploy[:deploy_to]}/current/storage"
    action :run
    only_if { ::File.directory?("#{deploy[:deploy_to]}/current/storage") }
  end
  
  execute "bootstrap_permission" do
    command "chmod -R 777 #{deploy[:deploy_to]}/current/bootstrap"
    action :run
    only_if { ::File.directory?("#{deploy[:deploy_to]}/current/bootstrap") }
  end
end
