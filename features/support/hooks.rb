Before '@config' do
  FileUtils.mkdir_p "tmp/aruba/config/"
  FileUtils.cp "#{$fixtures}/config/ebooks", "tmp/aruba/config/"
end

Before '@corpus' do
  FileUtils.mkdir_p "tmp/aruba/cukes/ebooks/"
  FileUtils.cp "#{$fixtures}/tweets.csv", "tmp/aruba/cukes/ebooks/"
end

Before '@freezetime' do
  Timecop.freeze '1970-01-01 00:00:00 +0000'
end
