class User < ActiveRecord::Base
	attr_accessible :created_at, :email, :id, :name, :university_id, :updated_at
	has_many :authorizations
	has_many :messages
	has_many :hashtags
	belongs_to :sender, :class_name => 'PersonalMessage', :foreign_key => 'sender_id'
  	belongs_to :receiver, :class_name => 'PersonalMessage', :foreign_key => 'receiver_id'

	validates :name, :email, :presence => true
	validates :email, :uniqueness => true

	def add_provider(auth_hash)
		# Check if the provider already exists for this user
		unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
			Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
		end
	end
end
