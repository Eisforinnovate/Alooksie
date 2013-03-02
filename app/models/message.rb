class Message < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :notifications
  has_many :messagematches #might need to be messagematchs
  has_many :messagehashtags
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 200 }
  default_scope order: 'messages.created_at DESC'  #defaults to displaying recent first

end
