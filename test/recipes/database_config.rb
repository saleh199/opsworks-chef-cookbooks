node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/current/config/database.php" do
    source "database.php.erb"
    mode 0644
    group deploy[:group]
  end
end


