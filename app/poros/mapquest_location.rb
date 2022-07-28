class MapquestLocation
  attr_reader :street,
              :county,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @street   = data[0][:street]
    @county   = data[0][:adminArea5]
    @city     = data[0][:adminArea4]
    @state    = data[0][:adminArea3]
    @zipcode  = data[0][:postalCode][0..4]
  end
end
