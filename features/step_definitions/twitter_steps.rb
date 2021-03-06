When /^I generate a tweet$/ do
  @g = Ebooks::Generator.new "#{$fixtures}/config/ebooks"
end

Then /^I should see "(.*?)"$/ do |output|
  expect(@g.to_s).to match /#{output}/
end

When /^I send a tweet$/ do
  tc = OpenStruct.new
  expect(::Twitter::REST::Client).to(receive(:new)).and_return(tc)
  expect(tc).to(receive(:update))

  @t = Ebooks::Generator.new "#{$fixtures}/config/ebooks"
  @t.tweet
  expect(@t.twitter.config[:consumer_key]).to eq 'key'
end

Then /^I should see something like "(.*?)"$/  do |output|
  expect(@t.twitter.to_s).to match /#{output}/
end
