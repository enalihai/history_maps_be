class LocIndexResult

  attr_reader :title,
              :collection_link,
              :id

  def initialize(data)
    @title = data[:title]
    @collection_link = data[:links][:item]
    @id = data[:pk]
  end
end
