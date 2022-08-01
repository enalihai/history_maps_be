class LocIndexResult

  attr_reader :title,
              :collection_link,
              :id,
              :index_id

  def initialize(data)
    @title = data[:title]
    @collection_link = data[:links][:item]
    @id = data[:pk]
    @index_id = data[:index]
  end
end
