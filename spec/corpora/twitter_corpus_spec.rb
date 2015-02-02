require 'spec_helper'

module Ebooks
  module Corpora
    describe TwitterCorpus do
      before :each do
        @c = Config.new File.join(File.dirname(__FILE__), '..', 'fixtures/config/ebooks')
        @tc = TwitterCorpus.new @c
      end

      it 'produces an output file' do
        @tc.generate
        expect(File).to exist 'spec/fixtures/ebooks/markov_dict.txt'
        expect(File.readlines('spec/fixtures/ebooks/markov_dict.txt')[1]).to eq "rspec rspec rspec rspec\n"
      end

      it 'reads the tweet CSV file' do
        csv = @tc.csv
        expect(csv[0][5]).to match /rspec/
        expect(csv[1][5]).to match /updog/
      end

      context 'filter the tweet' do
        it 'strips links' do
          expect(TwitterCorpus.strip_links 'Link to http://whatever.com').to eq 'Link to'
        end

        it 'strips newlines' do
          expect(TwitterCorpus.strip_newlines 'This
          has a newline').to eq 'This has a newline'
        end

        it 'strips usernames' do
          expect(TwitterCorpus.strip_usernames 'Sam @pikesley').to eq 'Sam'
        end

        it 'strips RTs' do
          expect(TwitterCorpus.strip_rts 'RT This is a retweet').to eq 'This is a retweet'
        end

        it 'compresses spaces' do
          expect(TwitterCorpus.compress_spaces ' This    has extraneous   spaces').to eq 'This has extraneous spaces'
        end

        it 'applies all the filters' do
          tweet = 'RT Link from @pikesley to https://pikesley.org with
          newlines '
          expect(TwitterCorpus.filter tweet).to eq 'Link from to with newlines'
        end
      end
    end
  end
end
