module Ebooks
  class Twitter
    attr_reader :text

    def initialize config
      if config.keys.include? :consumer_key
        config = {twitter: config}
      end
      @consumer_key        = config[:twitter][:consumer_key]
      @consumer_secret     = config[:twitter][:consumer_secret]
      @access_token        = config[:twitter][:oauth_token]
      @access_token_secret = config[:twitter][:oauth_token_secret]

    #  @text = text #if text
    end

    def twitter_client
      ::Twitter::REST::Client.new do |config|
        config.consumer_key        = @consumer_key
        config.consumer_secret     = @consumer_secret
        config.access_token        = @access_token
        config.access_token_secret = @access_token_secret
      end
    end

    def text= text
      @text = Ebooks.truncate text
    end

    def tweet text = nil
      @text = text if text
      twitter_client.update(@text)
    end

    def to_s
      "#{Time.now}: #{@text}"
    end
  end

  def self.truncate text, limit = 140
    return_text = ''
    text.split.each do |word|
      new_text = "#{return_text} #{word}".strip
      if new_text.length > limit
        return trimmer return_text
      else
        return_text = new_text
      end
    end

    trimmer return_text
  end

  def self.trimmer text
    final_char = text[-1]
    punctuation = [',']

    if punctuation.include? final_char
      return text[0..-2]
    end

    text
  end
end
