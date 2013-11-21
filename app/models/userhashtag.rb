class Userhashtag < ActiveRecord::Base
  attr_accessible :hashtag_id, :user_id, :name

  validates :hashtag_id, :user_id, presence: true

  belongs_to :user
  belongs_to :hashtag
  
end
