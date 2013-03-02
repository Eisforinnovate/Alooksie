class Messagehashtag < ActiveRecord::Base
  attr_accessible :hashtag_id, :message_id

  validates :hashtag_id, precense: true
  validates :message_id, precense: true

  belongs_to :message
  belongs_to :hashtag

end
