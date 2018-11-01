require 'aruba/cucumber'
require 'cucumber/rspec/doubles'
require 'timecop'
require 'coveralls'

require 'ebooks'

Coveralls.wear_merged!

$fixtures = File.join(File.dirname(__FILE__), 'fixtures/')

at_exit do
  Timecop.return
end
