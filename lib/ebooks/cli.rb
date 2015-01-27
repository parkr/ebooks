require 'ebooks'

module Ebooks
  class CLI < Thor
    desc 'version', 'Print ebooks version'
    def version
      puts "ebooks version #{VERSION}"
    end
    map %w(-v --version) => :version

    desc 'generate', 'Generate a tweet'
    method_option :config, :aliases => '-c', :desc => 'Specify config file'
    def generate
      g = Generator.new options[:config]
      puts g
    end

    desc 'tweet', 'Tweet a tweet'
    method_option :config, :aliases => '-c', :desc => 'Specify config file'
    def tweet
#      puts '1970-01-01 00:00:00 +0000:'
      g = Generator.new options[:config]
      g.tweet
    end
  end
end
