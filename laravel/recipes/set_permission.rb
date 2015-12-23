node[:deploy].each do |application, deploy|
  execute "chmod_laravel_public" do
    command "chmod -R 777 #{deploy[:deploy_to]}/current/storage"
    action :run
  end
end
