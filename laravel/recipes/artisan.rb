node[:deploy].each do |application, deploy|
  script "artisan" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php artisan migrate --path=database/migrations/
    EOH
  end
end 
