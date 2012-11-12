class Message < ActiveRecord::Base
  attr_accessible :recipient, :recipient_id, :text, :title
  belongs_to :recipient, class_name: "User"

  validates_presence_of :title, :text, :recipient
end
