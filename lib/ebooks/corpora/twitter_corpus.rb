module Ebooks
  module Corpora
    class TwitterCorpus
      MATCHERS = {
        links:     /(?:f|ht)tps?:\/[^\s]+/,
        newlines:  /\n/,
        usernames: /@[a-z0-9_]+/i,
        rts:       /[R|M]T/,
        hashtags:  /#/,
        spaces:    /\s+/
      }

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
        MATCHERS.keys.each do |offender|
          tweet = self.send("excise_#{offender}", tweet)
        end

        tweet
      end

      def self.method_missing method_name, *args
        mname = method_name.to_s

        if mname =~ /excise_/
          offender = mname.split('_')[1].to_sym
          tweet = args[0]

          tweet.gsub(MATCHERS[offender], ' ').gsub(/\s+/, ' ').strip
        end
      end
    end
  end
end
