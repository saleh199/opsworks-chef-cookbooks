node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/current/public/.htaccess" do
    source "htaccess.erb"
    mode 755
    group deploy[:group]
    only_if { ::File.exists?("#{deploy[:deploy_to]}/current/public/.htaccess") }
  end
end
