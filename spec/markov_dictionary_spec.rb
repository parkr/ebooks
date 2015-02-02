require 'spec_helper'

module Ebooks
  describe MarkovDictionary do
    it 'generates a dictionary file' do
      c = Config.new File.join(File.dirname(__FILE__), 'fixtures/config/ebooks')
      md = MarkovDictionary.new c
      expect(File).to exist 'spec/fixtures/ebooks/dictionary.mmd'
      expect(Digest::MD5.file('spec/fixtures/ebooks/dictionary.mmd').to_s).to eq 'dc925c22954ec8f6cc5df041ffd7d913'
    end
  end
end
