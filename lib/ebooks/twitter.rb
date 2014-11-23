module Ebooks
  class Twitter

    def initialize(credentials = {})
      @consumer_key        = credentials.fetch(:consumer_key)
      @consumer_secret     = credentials.fetch(:consumer_secret)
      @access_token        = credentials.fetch(:oauth_token)
      @access_token_secret = credentials.fetch(:oauth_token_secret)
    end

    def tweet(tweet_text)
      twitter_client = ::Twitter::REST::Client.new do |config|
        config.consumer_key        = @consumer_key
        config.consumer_secret     = @consumer_secret
        config.access_token        = @access_token
        config.access_token_secret = @access_token_secret
      end

      tweet_text = tweet_text.gsub('@', '')[0..139]
      p "#{Time.now}: #{tweet_text}"
      twitter_client.update(tweet_text)
    end
  end
end
