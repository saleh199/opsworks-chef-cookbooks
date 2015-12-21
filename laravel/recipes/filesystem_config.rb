node[:deploy].each do |application, deploy|
  ruby_block "s3_config" do
    block do
      file = Chef::Util::FileEdit.new("#{deploy[:deploy_to]}/current/config/filesystems.php")
      file.insert_line_if_no_match("/'key'    => env\('S3_KEY', ''\),/", "'key'    => 'AKIAIX7NPZKZZDMNABWA',")
      file.insert_line_if_no_match("/'secret'    => env\('S3_SECRET', ''\),/", "'secret'    => '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',")
      file.insert_line_if_no_match("/'region'    => env\('S3_REGION', ''\),/", "'region'    => 'us-west-1',")
      file.insert_line_if_no_match("/'bucket'    => env\('S3_BUCKET', ''\),/", "'bucket'    => 'overestate',")
      file.write_file
    end
  end
end
