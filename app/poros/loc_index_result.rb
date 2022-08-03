class LocIndexResult

  attr_reader :title,
              :collection_link,
              :full_id,
              :short_id,
              :image_full,
              :image_thumbnail,
              :index_id,
              :creator,
              :published_date

  def initialize(data)
    @title = data[:title]
    @collection_link = data[:links][:item]
    @full_id = data[:pk]
    @short_id = @full_id[0..5]
    @index_id = data[:index]
    @image_full = data[:image][:full]
    @image_thumbnail = data[:image][:thumb]
    @creator = data[:creator]
    @published_date = data[:created_published_date]
  end
end
