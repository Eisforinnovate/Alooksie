class Messagematch < ActiveRecord::Base
  attr_accessible #none, handled by application
  belongs_to :user
  belongs_to :message

  validates :user_id, presence: true
  validates :message_id, presence: true
end
