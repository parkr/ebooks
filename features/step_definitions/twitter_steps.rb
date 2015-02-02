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

  @g = Ebooks::Generator.new "#{$fixtures}/config/ebooks"
  @g.tweet
end
