module Ebooks
  class Config
    attr_reader :conf
    
    def initialize conf_file = nil
      @conf = YAML.load File.open File.join(File.dirname(__FILE__), '..', '..', 'config/defaults.yaml')

      if conf_file
        conf_file.sub!('~', ENV["HOME"])
        locals = YAML.load(File.open(conf_file))
        @conf = @conf.deep_merge locals
      end
    end

    def override overrides
      @conf = @conf.deep_merge overrides
    end

    def [] key
      @conf[key]
    end

    def keys
      @conf.keys
    end

    def self.from_hash h
      c = Config.new
      c.override h

      c
    end
  end
end
