module Ebooks
  module Corpora
    class TwitterCorpus
      def initialize config
        @config = config
      end

      def generate
        File.exists?(@config[:corpus_path]) || begin
          FileUtils.mkdir_p File.dirname @config[:corpus_path]
          File.open(@config[:corpus_path], 'w') do |file|
            csv.reverse_each do |row|
              file.write("#{TwitterCorpus.filter row[5]}\n")
            end
          end
        end
      end

      def csv
        @csv ||= CSV.read(@config[:tweets_csv_path])[1..-1]
      end

      def self.filter tweet
        self.compress_spaces self.strip_rts self.strip_usernames self.strip_newlines self.strip_links tweet
      end

      def self.strip_links tweet
        tweet.gsub(/(?:f|ht)tps?:\/[^\s]+/, '').strip
      end

      def self.strip_newlines tweet
        tweet.gsub(/\n/,' ').gsub(/\s+/, ' ')
      end

      def self.strip_usernames tweet
        tweet.gsub(/@[a-z0-9_]+/i, '').strip
      end

      def self.strip_rts tweet
        tweet.gsub(/[R|M]T/, '').strip
      end

      def self.compress_spaces tweet
        tweet.gsub(/\s+/, ' ').strip
      end
    end
  end
end
