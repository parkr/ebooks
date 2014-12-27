module Ebooks
  class Generator

    attr_accessor :dictionary

    def initialize(config)
      @tweets_csv_path = config[:tweets_csv_path]
      @corpus_path     = config[:corpus_path]
      build_corpus
      @dictionary_name = config[:dictionary_name]
      @dictionary      = build_dictionary
    end

    def generate_twitter_corpus
      # Go to Twitter.com -> Settings -> Download Archive.
      # This tweets.csv file is in the top directory. Put it in the same directory as this script.
      csv_text = CSV.read(@tweets_csv_path)

      # Create a new clean file of text that acts as the seed for your Markov chains
      File.open(@corpus_path, 'w') do |file|
        csv_text.reverse_each do |row|
          # Strip links, new lines, usernames and manual RTs
          tweet_text = row[5]
                        .gsub(/(?:f|ht)tps?:\/[^\s]+/, '')
                        .gsub(/\n/,' ')
                        .gsub(/@[a-z0-9_]+/i, '')
                        .gsub(/[R|M]T/, '')
          # Save the text
          file.write("#{tweet_text}\n")
        end
      end
    end

    def generate_sentence
      # Run when you want to generate a new Markov tweet
      dictionary.generate_n_sentences(2).split(/\#\</).first.chomp.chop
    end

    private

    def build_corpus
      unless File.exists?(@corpus_path)
        generate_twitter_corpus
      end
    end

    def build_dictionary
      if File.exists?(dictionary_path)
        MarkyMarkov::Dictionary.new(@dictionary_name)
      else
        markov = MarkyMarkov::Dictionary.new(@dictionary_name)
        markov.parse_file(@corpus_path)
        markov.save_dictionary!
        markov
      end
    end

    def dictionary_path
      "#{@dictionary_name}.mmd"
    end

  end
end
