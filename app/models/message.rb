class Message < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  has_many :notifications
  has_many :messagematchs
  has_many :messagehashtags
  validates :user_id, :content, presence: true
  validates :content, :length => { minimum: 1, maximum: 200 }
  default_scope order: 'messages.created_at DESC'  #defaults to displaying recent first

end
