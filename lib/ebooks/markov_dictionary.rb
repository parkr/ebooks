module Ebooks
  class MarkovDictionary
    def initialize config
      @config = config
      if File.exists?(dictionary_path)
        MarkyMarkov::Dictionary.new(@config[:dictionary_name])
      else
        markov = MarkyMarkov::Dictionary.new(@config[:dictionary_name])
        markov.parse_file(@config[:corpus_path])
        markov.save_dictionary!
        markov
      end
    end

    def dictionary_path
      "#{@config[:dictionary_name]}.mmd"
    end
  end
end
