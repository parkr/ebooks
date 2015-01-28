Given /^I authenticate to Twitter$/ do
  @tc = double 'twitter_client'
  allow(::Twitter::REST::Client).to(receive(:new)).and_return @tc
end

When /^I successfully run the command `(.*?)`$/ do |cmd|
  allow(@tc).to(receive(:update))
end
