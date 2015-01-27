require 'aruba/cucumber'
require 'cucumber/rspec/doubles'
require 'timecop'

require 'ebooks'

$fixtures = File.join(File.dirname(__FILE__), 'fixtures/')

at_exit do
  Timecop.return
end
