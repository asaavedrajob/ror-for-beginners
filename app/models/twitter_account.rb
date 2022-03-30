class TwitterAccount < ApplicationRecord
  belongs_to :user
  has_many :tweets

  validates :username, uniqueness: true


  def get_username_lbl
    "@#{username}"
  end

  def get_twitter_url
    "https://twitter.com/#{username}"
  end

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
