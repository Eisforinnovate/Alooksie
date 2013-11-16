class UserSerializer < ActiveModel::Serializer
	attributes :id, :name, :email, :university_id, :created_at, :updated_at
end