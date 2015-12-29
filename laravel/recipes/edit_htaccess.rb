node[:deploy].each do |application, deploy|
  template "#{deploy[:deploy_to]}/current/public/.htaccess" do
    source "htaccess.erb"
    mode 755
    group deploy[:group]
  end
end
