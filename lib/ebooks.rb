require "ebooks/version"

require 'rubygems'
require 'thread'
require 'csv'
require 'twitter'
require 'marky_markov'

module Ebooks
  autoload :Generator, 'ebooks/generator'
  autoload :Twitter,   'ebooks/twitter'

  def self.configuration(overrides = {})

  end

  def self.generate(config = {})
    config = self.configuration(config)

  end
end
