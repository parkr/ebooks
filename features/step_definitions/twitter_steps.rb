Given /^I authenticate to Twitter$/ do
  twitter_client = double('twitter_client')
  expect(::Twitter::REST::Client.new).to(receive(:any)).and_return(twitter_client)
end

And /^I have a Twitter client$/ do
  twitter_client = double('twitter_client')
  allow(::Twitter::REST::Client.new).to(receive(:any)).and_return(twitter_client)
  allow(twitter_client).to(receive(:update).with(:any))
end
