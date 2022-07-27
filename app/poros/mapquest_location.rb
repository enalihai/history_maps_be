class MapquestLocation
  attr_reader :street,
              :county,
              :city,
              :state,
              :zipcode

  def initialize(data)
    @street   = data[:results][0][:locations][0][:street]
    @county   = data[:results][0][:locations][0][:adminArea5]
    @city     = data[:results][0][:locations][0][:adminArea4]
    @state    = data[:results][0][:locations][0][:adminArea3]
    @zipcode  = data[:results][0][:locations][0][:postalCode][0..4]
  end
end
