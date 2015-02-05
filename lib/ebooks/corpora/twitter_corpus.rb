module Ebooks
  module Corpora
    class TwitterCorpus
      def initialize config
        @config = config
        generate
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
        %w{
          rts
          usernames
          newlines
          links
          hashtags
          spaces
        }.each do |offender|
          tweet = self.send("excise_#{offender}", tweet)
        end

        tweet
      end

      def self.method_missing method_name, *args
        mname = method_name.to_s

        if mname =~ /excise_/
          offender = mname.split('_')[1]
          tweet = args[0]

          case offender
            when 'links'
              tweet.gsub(/(?:f|ht)tps?:\/[^\s]+/, '').strip

            when 'newlines'
              tweet.gsub(/\n/,' ').gsub(/\s+/, ' ').strip

            when 'usernames'
              tweet.gsub(/@[a-z0-9_]+/i, '').strip

            when 'rts'
              tweet.gsub(/[R|M]T/, '').strip

            when 'hashtags'
              tweet.gsub(/#/, '').strip

            when 'spaces'
              tweet.gsub(/\s+/, ' ').strip
          end
        end
      end
    end
  end
end
