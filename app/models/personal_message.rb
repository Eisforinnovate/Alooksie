class PersonalMessage < ActiveRecord::Base
  attr_accessible :content, :receiver_id, :anonymous, :reply
  has_many :users

end
