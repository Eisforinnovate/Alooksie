class MessageSerializer < ActiveModel::Serializer
	attributes :id, :content, :name, :user_id, :created_at, :updated_at	
end