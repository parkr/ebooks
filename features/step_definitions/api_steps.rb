Given /^I initialise the config$/ do
end

And /^I do Ebooks\.generate\(config\)$/ do
  overrides = {
    :tweets_csv_path => 'tmp/aruba/cukes/ebooks/tweets.csv',
    :corpus_path     => 'tmp/aruba/cukes/ebooks/markov_dict.txt',
    :dictionary_name => 'tmp/aruba/cukes/ebooks/dictionary'
  }

  @config = Ebooks.configuration(overrides)
  @g = Ebooks.generate @config
end

Then /^it should generate "(.*?)"$/ do |text|
  expect(@g).to match /#{text}/
end

And /^I do Ebooks\.tweet\(config\)$/ do
  overrides = {
    :tweets_csv_path => 'tmp/aruba/cukes/ebooks/tweets.csv',
    :corpus_path     => 'tmp/aruba/cukes/ebooks/markov_dict.txt',
    :dictionary_name => 'tmp/aruba/cukes/ebooks/dictionary',
    :twitter => {
      :consumer_key       =>    'ck',
      :consumer_secret    =>    'cs',
      :oauth_token        =>    'ot',
      :oauth_token_secret => 'os'
    }
  }

  tc = OpenStruct.new
  expect(::Twitter::REST::Client).to(receive(:new)).and_return(tc)
  expect(tc).to(receive(:update))

  @config = Ebooks.configuration(overrides)
  @t = Ebooks.tweet @config
end

Then /^it should send a tweet$/  do
end

And /^it should give me "(.*?)"$/ do |text|
  expect(@t.to_s).to match /#{text}/
end

Given /^I do Ebooks::Twitter\.new\(config\[:twitter\]\)\.tweet\('This is not a Markov tweet'\)$/ do
  config = {
    :twitter => {
      :consumer_key       =>    'ck',
      :consumer_secret    =>    'cs',
      :oauth_token        =>    'ot',
      :oauth_token_secret => 'os'
    }
  }

  tc = OpenStruct.new
  expect(::Twitter::REST::Client).to(receive(:new)).and_return(tc)
  expect(tc).to(receive(:update))

  @m = Ebooks::Twitter.new(config[:twitter]).tweet('This is not a Markov tweet')
end

Then /^it should not explode in my face$/ do
end
