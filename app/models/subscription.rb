class Subscription < ActiveRecord::Base
	has_one :user
  attr_accessible :user, :max_messages

  def can_send_message?
  		user.sent_messages.count < max_messages
  end
end
