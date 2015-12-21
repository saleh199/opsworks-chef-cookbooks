node[:deploy].each do |application, deploy|
  ruby_block "s3_config" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/current/config/filesystems.php")
      file.search_file_replace("/'key'    => env\('S3_KEY', ''\),/", "'key'    => 'AKIAIX7NPZKZZDMNABWA',")
      file.search_file_replace("/'secret'    => env\('S3_SECRET', ''\),/", "'secret'    => 'b8r3NWv8/Xqsfc9sF/yMxco/p/3yeMo/0ZmZC9Mg',")
      file.search_file_replace("/'region'    => env\('S3_REGION', ''\),/", "'region'    => 'us-west-1',")
      file.search_file_replace("/'bucket'    => env\('S3_BUCKET', ''\),/", "'bucket'    => 'overestate',")
      file.write_file
    end
  end
end
