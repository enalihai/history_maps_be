class UserSerializer
  include JSONAPI::Serializer
  attributes :email, :username

end
