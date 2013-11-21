class UserhashtagSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :hashtag_id, :created_at, :updated_at	
end