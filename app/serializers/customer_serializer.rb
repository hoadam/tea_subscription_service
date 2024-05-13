class CustomerSerializer
  include JSONAPI::Serializer
  has_many :subscriptions

  attributes :first_name, :last_name, :email, :address
end
