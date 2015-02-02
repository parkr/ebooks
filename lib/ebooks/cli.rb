require 'ebooks'

module Ebooks
  class CLI < Thor
    desc 'version', 'Print ebooks version'
    def version
      puts "ebooks version #{VERSION}"
    end
    map %w(-v --version) => :version

    desc 'generate', 'Generate a tweet'
    method_option :config, :aliases => '-c', :desc => 'Specify config file', :default => '~/.ebooks'
    def generate
      g = Generator.new options[:config]
      puts g
    end

    desc 'tweet', 'Tweet a tweet'
    method_option :config, :aliases => '-c', :desc => 'Specify config file', :default => '~/.ebooks'
    def tweet
      g = Generator.new options[:config]
      g.tweet
      puts g.twitter.to_s
    end
  end
end
