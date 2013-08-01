class PersonalMessage < ActiveRecord::Base
  attr_accessible :content, :receiver_id, :anonymous
  has_many :users

end
