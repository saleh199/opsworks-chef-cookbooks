execute "chmod_laravel_public" do
  command "chmod -R 777 /var/www/html/project-name/app/storage"
  action :run
end
