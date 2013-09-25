module Ebooks
  module Generator

    def self.generate_twitter_corpus(config)
      tweets_csv_path = config[:tweets_csv_path]
      corpus_path     = config[:corpus_path]

      # Go to Twitter.com -> Settings -> Download Archive.
      # This tweets.csv file is in the top directory. Put it in the same directory as this script.
      csv_text = CSV.parse(File.read(tweets_csv_path))

      # Create a new clean file of text that acts as the seed for your Markov chains
      File.open(corpus_path, 'w') do |file|
        csv_text.reverse.each do |row|
          # Strip links and new lines
          tweet_text = row[5].gsub(/(?:f|ht)tps?:\/[^\s]+/, '').gsub(/\n/,' ')
          # Save the text
          file.write("#{tweet_text}\n")
        end
      end
    end

    def self.generate_sentence(config)
      corpus_path     = config[:corpus_path]
      dictionary_name = config[:dictionary_path].gsub(/\.mmd$/, '')

      # Run when you want to generate a new Markov tweet
      markov = MarkyMarkov::Dictionary.new('dictionary') # Saves/opens dictionary.mmd
      markov.parse_file(corpus_path)
      tweet_text = markov.generate_n_sentences(2).split(/\#\</).first.chomp.chop
      markov.save_dictionary!
    end

  end
end
