node[:deploy].each do |application, deploy|
  ruby_block "s3_config" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/current/config/filesystems.php")
      file.search_file_replace("/'key'    => env\('S3_KEY', ''\),/", "'key'    => 'AKIAJQ2ZKXWQSAYWPKIQ',")
      file.search_file_replace("/'secret'    => env\('S3_SECRET', ''\),/", "'secret'    => '9keE61AEfeDImBNjfvxWIOopPQbYrVtgETCChg/e',")
      file.search_file_replace("/'region'    => env\('S3_REGION', ''\),/", "'region'    => 'us-east-1',")
      file.search_file_replace("/'bucket'    => env\('S3_BUCKET', ''\),/", "'bucket'    => 'testoverestate',")
      file.write_file
    end
  end
end
