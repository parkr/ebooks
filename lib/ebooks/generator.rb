module Ebooks
  class Generator
    attr_accessor :dictionary

    def initialize(config_file = '~/.ebooks')
      @config = Config.new config_file
      @corpus = Corpora::TwitterCorpus.new @config
      @corpus.generate
      @markov = MarkovDictionary.new @config
    end

    def generate
      @markov.generate_sentences
    end

    def tweet
      Ebooks::Twitter.new(@config).tweet(generate)
    end

    def to_s
      generate
    end
  end
end
