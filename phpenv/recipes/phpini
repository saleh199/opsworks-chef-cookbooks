ruby_block "php_ini" do
  block do
    file = Chef::Util::FileEdit.new("/etc/php5/apache2/php.ini")
    file.insert_line_if_no_match("/upload_max_filesize = 2M/", "upload_max_filesize = 10M")
    file.write_file
  end
end

service "apache2" do
  action :restart
end
