class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :cust_name
  has_many :user
end
