module Ebooks
  class Generator
    attr_accessor :twitter

    def initialize(config_file = nil) #'~/.ebooks')
      @config = Config.new config_file
      configure @config
    end

    def configure config
      @corpus = Corpora::TwitterCorpus.new config
      @corpus.generate
      @markov = MarkovDictionary.new config

      @config = config
    end

    def configure_from_hash h
      configure Config.from_hash h.conf
    end

    def generate
      @generate ||= @markov.generate_sentences
    end

    def tweet
      @twitter = Ebooks::Twitter.new(@config, generate)
      @twitter.tweet
    end

    def to_s
      generate
    end
  end
end
