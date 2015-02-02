module Ebooks
  class Generator
    attr_accessor :twitter

    def initialize(config_file = '~/.ebooks')
      @config = Config.new config_file
      @corpus = Corpora::TwitterCorpus.new @config
      @corpus.generate
      @markov = MarkovDictionary.new @config
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
