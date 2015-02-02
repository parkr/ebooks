require 'rubygems'
require 'thread'
require 'csv'
require 'twitter'
require 'marky_markov'
require 'yaml'
require 'thor'

$:.unshift(File.dirname(__FILE__))

require 'ebooks/version'
require 'ebooks/core_ext'
require 'ebooks/config'
require 'ebooks/twitter'
require 'ebooks/corpora/twitter_corpus'

module Ebooks
  autoload :Generator, 'ebooks/generator'
  autoload :Twitter,   'ebooks/twitter'

  class << self
    def read_config_file(file = '~/.ebooks')
#      contents = File.read(file.sub('~', ENV["HOME"]))
      contents = File.read(file)
      YAML.load(contents)
    end

    def configuration(overrides = {})
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

    def generate(overrides = {})
      config = configuration(overrides)
      generator = Ebooks::Generator.new(config)

      generator.generate_sentence
    end

    def tweet(overrides = {})
      config = configuration(overrides)
      Ebooks::Twitter.new(config[:twitter]).tweet(generate(overrides))
    end
  end

end
