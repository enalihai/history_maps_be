class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :location, :user_id
end
