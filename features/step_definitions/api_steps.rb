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
