class Messagehashtag < ActiveRecord::Base
  attr_accessible :hashtag_id, :message_id

  validates :hashtag_id, :message_id, presence: true

  belongs_to :message
  belongs_to :hashtag

end
