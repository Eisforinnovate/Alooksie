class PersonalMessage < ActiveRecord::Base
  attr_accessible :content, :receiver_id
  has_many :users

end
