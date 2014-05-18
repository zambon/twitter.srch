class Tweet
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :profile_image_url, :from_user, :text, :created_at

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def self.parse(tweets)
    tweets.collect do |tweet|
      Tweet.new(
        profile_image_url: tweet.user.profile_image_url.to_s,
        from_user:         tweet.user.username,
        text:              tweet.text,
        created_at:        tweet.created_at
      )
    end
  end
end
