class Userhashtag < ActiveRecord::Base
  attr_accessible :hashtag_id, :user_id, :name
  attr_accessor :name

  validates :hashtag_id, :user_id, presence: true

  belongs_to :user
  belongs_to :hashtag
  
end
