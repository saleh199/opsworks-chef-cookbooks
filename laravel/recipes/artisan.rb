node[:deploy].each do |application, deploy|
  script "artisan" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php artisan migrate --path=database/migrations/
    php artisan migrate --path=database/migrations/2015_10_30
    php artisan migrate --path=database/migrations/2015_11_01
    EOH
  end
end 
