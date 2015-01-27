require 'ebooks'

module Ebooks
  class CLI < Thor
    desc 'version', 'Print ebooks version'
    def version
      puts "ebooks version #{VERSION}"
    end
  end
end
