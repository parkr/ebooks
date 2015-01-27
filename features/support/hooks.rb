Before '@config' do
  FileUtils.mkdir_p "tmp/aruba/config/ebooks"
  FileUtils.cp "#{$config_dir}/ebooks", "tmp/aruba/config/ebooks"
end
