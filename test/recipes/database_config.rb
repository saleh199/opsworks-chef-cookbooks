node[:deploy].each do |application, deploy|
  ruby_block "database_config" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/current/config/database.php")
      file.search_file_replace("/'default' => env\('MYSQL_DB_CONNECTION'\),/", "'default' => 'mysql',")
      file.search_file_replace("/'host' => env\('MYSQL_DB_HOST'\),/", "'host' => '172.31.40.255',")
      file.search_file_replace("/'database' => env\('MYSQL_DB_DATABASE'\),/", "'database' => 'overestate',")
      file.search_file_replace("/'username' => env\('MYSQL_DB_USERNAME'\),/", "'username' => 'root',")
      file.search_file_replace("/'password' => env\('MYSQL_DB_PASSWORD'\),/", "'password' => '0verEst@te',")
      file.write_file
    end
  end
end


