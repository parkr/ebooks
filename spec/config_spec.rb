require 'spec_helper'

module Ebooks
  describe Config do
    it 'has defaults' do
      @c = Config.new
      expect(@c[:tweets_csv_path]).to eq 'tweets.csv'
      expect(@c[:corpus_path]).to eq 'markov_dict.txt'
    end

    it 'can absorb overrides' do
      @c = Config.new File.join(File.dirname(__FILE__), '..', 'features/support/fixtures/config/ebooks')
      expect(@c[:tweets_csv_path]).to eq 'tmp/aruba/cukes/ebooks/tweets.csv'
      expect(@c[:twitter][:consumer_key]).to eq 'key'
    end

    it 'can be initialised from a hash' do
      h = {
        :tweets_csv_path => 'foo/bar.csv'
      }

      c = Config.from_hash h
      expect(c[:tweets_csv_path]).to eq 'foo/bar.csv'
    end
  end
end
