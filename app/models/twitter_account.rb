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
end
