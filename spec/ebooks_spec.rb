require 'spec_helper'

module Ebooks
  describe 'truncate' do
    it 'does not mutilate a word' do
      expect(Ebooks.truncate 'foo bar', 5).to eq 'foo'
    end

    it 'does not cut a word in half at 140 characters' do
      text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas imperdiet sit amet lectus a vehicula. Pellentesque quis erat elementum, pulvinar libero a, laoreet ex. Aenean ipsum tellus, sollicitudin vel turpis vitae, consectetur finibus quam.'

      expect(Ebooks.truncate text).to eq 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas imperdiet sit amet lectus a vehicula. Pellentesque quis erat elementum'
    end

    it 'trims trailing punctuation' do
      text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas imperdiet sit amet a vehicula. Pellentesque quis erat elementum, pulvinar, veni vidi vici'

      expect(Ebooks.truncate text).to eq 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas imperdiet sit amet a vehicula. Pellentesque quis erat elementum, pulvinar'
    end
  end

  describe 'trimmer' do
    it 'removes a trailing comma' do
      expect(Ebooks.trimmer 'words,').to eq 'words'
    end

    it 'does nothing if no trailing comma' do
      expect(Ebooks.trimmer 'embedded, comma').to eq 'embedded, comma'
    end
  end
end
