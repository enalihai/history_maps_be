class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :location_id, :user_id, :title, :other_titles, :pdf, :photo, :details
end
