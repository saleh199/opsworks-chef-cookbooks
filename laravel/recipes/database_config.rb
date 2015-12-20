node[:deploy].each do |application, deploy|
  ruby_block "database_config" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/current/config/database.php")
      file.insert_line_if_no_match("/'default' => env('MYSQL_DB_CONNECTION'),/", "default' => 'mysql',")
      file.insert_line_if_no_match("/'host' => env('MYSQL_DB_HOST'),/", "default' => '172.31.17.103',")
      file.insert_line_if_no_match("/'database' => env('MYSQL_DB_DATABASE'),/", "default' => 'overestate',")
      file.insert_line_if_no_match("/'username' => env('MYSQL_DB_USERNAME'),/", "default' => 'root',")
      file.insert_line_if_no_match("/'password' => env('MYSQL_DB_PASSWORD'),/", "default' => '0verEst@te',")
      file.write_file
    end
  end
end
