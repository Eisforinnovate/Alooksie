class UserhashtagSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :name, :hashtag_id, :created_at, :updated_at	
end