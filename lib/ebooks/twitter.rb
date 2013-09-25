module Ebooks
  module Twitter

    def initialize(credentials = {})
      @consumer_key        = credentials.fetch(:consumer_key)
      @consumer_secret     = credentials.fetch(:consumer_secret)
      @access_token        = credentials.fetch(:oauth_token)
      @access_token_secret = credentials.fetch(:oauth_token_secret)

      Twitter.configure do |config|
        config.consumer_key    = @consumer_key
        config.consumer_secret = @consumer_secret
      end
    end

    def tweet(tweet_text)
      twitter_client = Twitter::Client.new(:oauth_token => @access_token,
                                    :oauth_token_secret => @access_token_secret)
      p "#{Time.now}: #{tweet_text}"
      twitter_client.update(tweet_text)
    end

  end
end
