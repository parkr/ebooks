require 'rubygems'
require 'thread'
require 'csv'
require 'twitter'
require 'marky_markov'

$:.unshift(File.dirname(__FILE__))

require 'ebooks/version'
require 'ebooks/core_ext'

module Ebooks
  autoload :Generator, 'ebooks/generator'
  autoload :Twitter,   'ebooks/twitter'

  def self.configuration(overrides = {})
    {
      :tweets_csv_path => 'tweets.csv',
      :corpus_path     => 'markov_dict.txt',
      :dictionary_name => 'dictionary', # don't include the .mmd
      :twitter => {
        :consumer_key       => '',
        :consumer_secret    => '',
        :oauth_token        => '',
        :oauth_token_secret => ''
      }
    }.deep_merge(overrides)
  end

  def self.generate(overrides = {})
    config = self.configuration(overrides)

    unless File.exists?(config[:tweets_csv_path])
      Ebooks::Generator.generate_twitter_corpus(config)
    end

    Ebooks::Generator.generate_sentence(config)
  end

  def self.tweet(overrides = {})
    config = self.configuration(overrides)

    sentence = self.generate(overrides)

    Ebooks::Twitter.new(config).tweet(sentence)
  end
end
