class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

## Scenarios
## The idea with the validations is to not DELETE jobs, due to possible issues and it is not a "Best Practice"

# - Push the publish_at backward
# - from noon to 8am
# In this scenario a Tweet has been rescheduled to auto-send it sooner
#
# Clock says 8am
# tweet.published? => false
# tweet.publish_at > Time.current => false
# tweet.publish_to_twitter! => true
#
# 
# Clock says 12pm
# tweet.published? => true
# *** The code ends here

# - Push the publish_at forward
# - from 9am to 1pm
# In this scenario a Tweet has been rescheduled to auto-send it later
#
# Clock says 9am
# tweet.published? => false
# tweet.publish_at > Time.current => true
# *** The code ends here
#
# 
# Clock says 1pm
# tweet.published? => false
# tweet.publish_at > Time.current => false
# tweet.publish_to_twitter! => true