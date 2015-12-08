node[:deploy].each do |application, deploy|
  script "artisan" do
    interpreter "bash"
    user "root"
    cwd "#{deploy[:deploy_to]}/current"
    code <<-EOH
    php artisan #{node[:command]} #{node[:parameters]}
    EOH
  end
end 
