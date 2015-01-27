Before '@config' do
  FileUtils.mkdir_p "tmp/aruba/config/"
  FileUtils.cp "#{$config_dir}/ebooks", "tmp/aruba/config/"
end
