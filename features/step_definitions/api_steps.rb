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
  @g = Ebooks.tweet @config
end
