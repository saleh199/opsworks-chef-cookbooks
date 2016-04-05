ruby_block "php_ini" do
  block do
    file = Chef::Util::FileEdit.new("/etc/php5/apache2/php.ini")
    file.insert_line_if_no_match("/upload_max_filesize = 2M/", "upload_max_filesize = 10M")
    file.insert_line_if_no_match("/post_max_size = 8M/", "post_max_size = 10M")
    file.write_file
    only_if { ::File.exists?("/etc/php5/apache2/php.ini") }
  end
end

service "apache2" do
  action :restart
  only_if { ::File.exists?("/etc/php5/apache2/php.ini") }
end
