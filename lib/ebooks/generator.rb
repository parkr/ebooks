module Ebooks
  class Generator

    attr_accessor :dictionary

    def initialize(config_file = '~/.ebooks')
      @config = Config.new config_file

      build_corpus
    end

    def generate_twitter_corpus
      # Go to Twitter.com -> Settings -> Download Archive.
      # This tweets.csv file is in the top directory. Put it in the same directory as this script.
      csv_text = CSV.read(@config[:tweets_csv_path])[1..-1]

      # Create a new clean file of text that acts as the seed for your Markov chains
      File.open(@config[:corpus_path], 'w') do |file|
        csv_text.reverse_each do |row|
          tweet_text = row[5]
                        .gsub(/(?:f|ht)tps?:\/[^\s]+/, '') # Strip links
                        .gsub(/\n/,' ') # Strip new lines
                        .gsub(/@[a-z0-9_]+/i, '') # Strip usernames
                        .gsub(/[R|M]T/, '') # Strip RTs
          # Save the text
          file.write("#{tweet_text}\n")
        end
      end
    end

    def generate_sentence
      # Run when you want to generate a new Markov tweet
      dictionary.generate_n_sentences(2).split(/\#\</).first.chomp.chop
    end

    def tweet
      Ebooks::Twitter.new(@config[:twitter]).tweet(generate_sentence)
    end

    def to_s
      generate_sentence
    end

    private

    def build_corpus
      unless File.exists?(@config[:corpus_path])
        generate_twitter_corpus
      end
    end

    def dictionary
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
