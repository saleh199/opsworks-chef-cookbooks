node[:deploy].each do |application, deploy|
  execute "storage_permission" do
    command "chmod -R 777 #{deploy[:deploy_to]}/current/storage"
    action :run
  end
  
  execute "bootstrap_permission" do
    command "chmod -R 777 #{deploy[:deploy_to]}/current/bootstrap"
    action :run
  end
end
