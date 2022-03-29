class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    # ||= (null equals operator) means that if the value already exists, just leave it, but if is nil/empty then set the default value
    self.publish_at ||= 24.hours.from_now
  end


  def published?
    tweet_id?
  end

  def get_twitter_url
    "https://twitter.com/#{twitter_account.username}/status/#{tweet_id}"
  end
end
