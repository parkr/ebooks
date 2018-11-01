module Ebooks
  module Corpora
    class TwitterCorpus
      FILTERS = YAML.load File.open File.join File.dirname(__FILE__), '..',                   '..', '..', 'config/filters.yaml'

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
        FILTERS.keys.each do |offender|
          tweet = self.send("excise_#{offender}", tweet)
        end

        tweet
      end

      def self.method_missing method_name, *args
        mname = method_name.to_s

        if mname =~ /excise_/
          offender = mname.split('_')[1].to_sym
          tweet = args[0]

          tweet.gsub(FILTERS[offender], ' ').gsub(/\s+/, ' ').strip
        end
      end
    end
  end
end
