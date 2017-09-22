class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :auth_token, :user_type, :customer_name
end
