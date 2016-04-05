node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/current/config/filesystems.php" do
    source "filesystems.php.erb"
    mode 0644
    group deploy[:group]
    only_if { ::File.exists?("#{deploy[:deploy_to]}/current/config/filesystems.php") }
  end
end
