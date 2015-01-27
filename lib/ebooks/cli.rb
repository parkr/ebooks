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
      puts g.generate_sentence
    end
  end
end
