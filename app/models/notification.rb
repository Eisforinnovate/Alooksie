class Notification < ActiveRecord::Base
  attr_accessible #none - nothing should be accessible, created by the application
  belongs_to :user
  belongs_to :message

  validates :user_id, presence: true
  validates :message_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
