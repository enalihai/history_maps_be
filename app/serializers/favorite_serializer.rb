class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :user_id, :title, :image_full, :short_id, :published_date, :creator, :thumbnail
end
