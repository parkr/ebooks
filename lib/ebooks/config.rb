module Ebooks
  class Config
    def initialize conf_file = nil
      @conf = YAML.load File.open File.join(File.dirname(__FILE__), '..', '..', 'config/defaults.yaml')

      if conf_file
        conf_file.sub!('~', ENV["HOME"])
        @overrides = YAML.load(File.open(conf_file))
        @conf = @conf.deep_merge @overrides
      end
    end

    def [] key
      @conf[key]
    end
  end
end
