require 'rubygems'
require 'thread'
require 'csv'
require 'twitter'
require 'marky_markov'
require 'yaml'
require 'thor'

require 'ebooks/version'
require 'ebooks/core_ext'
require 'ebooks/config'
require 'ebooks/twitter'
require 'ebooks/markov_dictionary'
require 'ebooks/generator'
require 'ebooks/corpora/twitter_corpus'

module Ebooks
  def self.configuration overrides = {}
    c = Config.from_hash overrides
    c
  end

  def self.generate config
    g = Generator.new
    g.configure_from_hash config
    g.generate
  end

  def self.tweet config
    g = Generator.new
    g.configure_from_hash config
    g.tweet
    g.twitter
  end
end
